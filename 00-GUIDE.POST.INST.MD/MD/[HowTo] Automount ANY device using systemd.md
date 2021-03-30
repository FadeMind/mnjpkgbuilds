- https://forum.manjaro.org/t/howto-automount-any-device-using-systemd/122947

## Disk device recognition
Manjaro uses udev (see [Arch Wiki][arch-udev]) to load devices at boot time. The loading of devices is arbitrary and therefore you cannot predict which device will be available at a given path.

But [static device names][udevstatic] do exist and you can assign specific locations to your device and thus ensure e.g. scripts will work as expected.

## What to learn
1. Why use mount unit
2. Structure and Content of a mount unit
3. Mount at boot (immediate mount)
4. Mount at demand (mount on first access)
5. Conclusion

## 1. Why use systemd mount units
---
Auto mounting a device using systemd is a simple secure approach.

For one - you don't have to edit your fstab - the slightest error in fstab can render your system unbootable.

This article will use an USB device which may or may not be available at boot time and when you plug it you want it to be mounted on a special path - it could be dedicated backup disk.

The basics of this guide can also be used to mount any extra devices available in your system, or remote shares e.g. WEBDAV, SMB, FTP and NFS. You can find link to a topic containing sample mount units at the end of this article.

## 2. Structure and Content of a mount unit
---
There is one mandatory rule - the name of the file. The file must be named as the path it mounts to. If your mount path is **/data/backup** the file must be named **data-backup.mount**. 

Create a file as root
```bash
$ sudo touch /etc/systemd/system/data-backup.mount
```

Open the file with your favorite CLI editor or a gvfs compliant editor (xed or gedit)
```bash
$ xed admin:/etc/systemd/system/data-backup.mount
```

### Template
Insert the following template into the file - and modify the description

```text
[Unit]
Description=Mount Backup disk (/data/backup)

[Mount]
What=
Where=
#Type=
#Options=

[Install]
WantedBy=multi-user.target
```

### Mount
The section **[Mount]** is the same data as you see in your fstab - except the **What** which must the full path to the device. The nature of systemd makes it impossible to rely on the traditional path **/dev/sda1** - luckily there is another **/dev/disk/by-uuid/** we can use.

### What
To get the device uuid you can use **lsblk** command and the **-no UUID** to retrieve the uuid you need for the mount. (substitute sdy1 with your actual device and partition)

```bash
$ lsblk -no UUID /dev/sdy1
67f922cd-a61f-4d5e-84c0-ac8335a7ce67
```

Then insert the UUID into the file
```text
What=/dev/disk/by-uuid/67f922cd-a61f-4d5e-84c0-ac8335a7ce67
```

### Where
Next type in the path where you want the device mounted. Normally we would create the path beforehand as this is required for fstab - but not with systemd. If the path do not exist it will be created.

:information_source: default permissions is 755 owned by root

```text
Where=/data/backup
```

:exclamation: Comment by @FadeMind  
[details="Caveat using dashes"]
Don't use a dash **-** in your path because a dash refer to a new branch on the folder tree and this will break the naming of the mount/automount file

* Invalid **/data/home-backup**
* Valid **/data/home_backup**
* Valid **/data/home\x2dbackup**

To get the correct name for your mount/automount filename when you use dashes in your folder-naming
```bash
$ systemd-escape -p --suffix=mount "/data/home-backup"
data/home\x2dbackup.mount
```
[/details]


### Type
The **Type** is optional for disk devices. 

If you don't know you can retrieve the file system the same way as the UUID.

Other types like NFS, SMB and FTP requires **Type** to be set.

```
$ lsblk -no FSTYPE /dev/sdy1
ext4
```
```text
Type=ext4
```

### Options
The **Options** is optional for disk devices. 

As with fstab it takes a comma separated list of options for the filesystem mounted. 

Other types like NFS, SMB and FTP requires **Options** to be set.
```text
Options=defaults,rw,noatime
```
Save the file

## 3. Mount on boot
---
This works just like your fstab - with the exception - it won't break your boot.

First reload the systemd daemon
```bash
$ sudo systemctl daemon-reload
```

Note the state of the mount
```bash
$ systemctl show -p ActiveState -p SubState --value data-backup.mount
```

Mount the device
```bash
$ sudo systemctl start data-backup.mount
```

Now you can verify the service
```bash
$ systemctl show -p ActiveState -p SubState --value data-backup.mount
```

Note that the folder was created by systemd - list the content of the mount
:information_source: note permissions changed to partition content
```bash
$ ls -la /data/backup
```
If the device is an internal device always available you can enable the mount and your device will be mounted during boot.

    sudo systemctl enable data-backup.mount

If - on the other hand - this is an USB device - which is not available at boot time - do not enable the the mount unit but proceed to create an automount unit for your USB device.

## 4. Mount on demand
---
An automount unit is a special unit which takes care of activating the corresponding mount unit when the mount path is accessed. The difference for mount and automount is **when** it is mounted.

To demonstrate the automount - first unmount the data-mount
```bash
$ sudo systemctl stop data-mount.mount
```

Verify  the content of the mount point - it should now be empty.
```bash
$ ls -la /data/backup
```

Now we proceed to create an automount for the mount. Create a file - it must be named using the same rule as the mount but with the extension of **.automount**
```bash
$ sudo touch /etc/systemd/system/data-backup.automount
```
:information_source: the automount service will fail if the device path is mounted

### Automount define
Edit the file and insert the following content and save it.
```text
[Unit]
Description=Automount backup partition
ConditionPathExists=/data/backup

[Automount]
Where=/data/backup
TimeoutIdleSec=10

[Install]
WantedBy=multi-user.target
```

### Test automount
---
Now enable and start the automount for data-backup
```bash
$ sudo systemctl enable --now data-backup.automount
```

You know you unmounted the device - don't mount it - just access the **/data/backup** folder from terminal or a file manager - you will find systemd mounts it behind the scenes.

## 5. Conclusion
---
This approach is a safer way than editing your fstab. Worst case the device is not mounted - if you make a mistake in fstab - the system breaks.

You can mount all kind of devices - NFS, SMB, FTP, WEBDAV, SFTP, SSH - using this recipe. Sample files for different kind of mounts can be found in [this topic][1].

[arch-udev]: https://wiki.archlinux.org/index.php/Udev
[udevstatic]: https://wiki.archlinux.org/index.php/Udev#Setting_static_device_names
[1]: https://forum.manjaro.org/t/sample-mount-units-for-systemd/135832?u=linux-aarhus
