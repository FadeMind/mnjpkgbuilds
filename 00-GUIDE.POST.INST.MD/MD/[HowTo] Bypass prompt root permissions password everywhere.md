https://forum.manjaro.org/t/howto-bypass-prompt-root-permissions-password-everywhere-20201019/32767

**Difficulty: ★★★★☆**

> **WARNING! Advanced users only!**
> 
>***The poster of this [HowTo] does not take responsibility for damages after applying changes to the settings. You use the below on your own responsibility.  The kdesu section is intended exclusively for KDE users.***


# Issue

The `sudo` prompt (GUI and terminal) require you to enter the root password each time.

# Main bypass guide

1. Set  `nano`  temporary as default editor for  `visudo`  and edit sudoers file:
   ```text
   sudo -i
   export EDITOR=nano
   visudo
   ```

2. Set `nano` as `visudo` default editor. Create file:
   ```text
   sudo nano /etc/sudoers.d/02-visudo-editor
   ```
   with code
   ```text
   ## Set nano as default editor
   Defaults env_reset
   Defaults editor=/usr/bin/nano, !env_editor
   ```
3. Skip password prompt for current user. Remember to use your UID instead of  `user_name`. Create file:
   ```text
   sudo nano /etc/sudoers.d/01-skip_auth
   ```
   with code
   ```text
   ## Skip password prompt for current user
   Defaults:user_name !authenticate
   ```
   Save the changes. *Changes are applied immediately.*
4. Create a new Polkit rule in your favorite editor as root:

   in `/etc/polkit-1/rules.d/49-nopasswd_global.rules` add/change:

   ```text
   /* Allow members of the wheel group to execute any actions
    * without password authentication, similar to "sudo NOPASSWD:"
    */
   polkit.addRule(function(action, subject) {
       if (subject.isInGroup("wheel")) {
           return polkit.Result.YES;
       }
   });
   ```

   Ensure that you are a member of the `wheel` group:

   ```text
   groups
   ```

   IF NOT, then add yourself:

   ```text
   sudo usermod --append --groups wheel user_name
   ```

  * Reboot to apply the above settings

# KDE additional bypass guide (follow after applying the above guide)

1. Set `sudo` as the default tool for  **kdesu**  command. Create file  `~/.config/kdesurc` with content:

   ```text
   [super-user-command]
   super-user-command=sudo
   ```

2. Add to  `/etc/environment`  these lines:

   ```text
   KDE_FULL_SESSION=true
   KDE_SESSION_VERSION=5
   ```

* **Reboot to apply these settings**
