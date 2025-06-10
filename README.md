# Born2beroot
An introduction to Sysadmin. 

### Installation Conditions:
- Minimal Debian 12 Install
- One primary volume (`/boot`), one logical volume (LUKS over LVM)
- Manually partitioned following this format: `/[root]`, `/home`, `/var`, `/tmp`, `/srv`, `[SWAP]`
- Hostname must be login + 42
- Username must be login

### Mandatory Part:
- SSH service running on port 4242 (must not be possible to connect thru SSH using root account)
- UFW must seal all ports except 4242
- Install & configure sudo:
  - 3 attempts for password authentication
  - Custom message on auth failure
  - Sudo actions logged to /var/log/sudo
  - TTY mode enabled
  - Sudo restricted from `/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin`
- Users `root` and `[username]` must exist
- User `[username]` must belong to groups `user42` and `sudo`
- Implement strong password policy:
  - Expires every 30 days
  - Min 2 days between password modifications
  - Warning message 7 days before expiration
  - 10 characters long; 1 uppercase, 1 lowercase, 1 number
  - cannot include 3 consecutive identical characters
  - cannot include username
  - must have >7 digits different from last password (root exempt)
- `monitoring.sh` script:
  - Run **on server startup** and every 10 mins
  - Must display:
    - Architecture & Kernel version
    - Physical processors
    - Virtual processors
    - Available RAM (+ usage %)
    - Available storage (+ usage %)
    - CPU Usage %
    - Date & Time of last reboot
    - LVM status
    - Active connections count
    - Active users on server
    - IPv4 & MAC Addresses
    - Sudo commands count
### Bonus Part:
- Setup WordPress with lighttpd, MariaDB, PHP
- Useful service of choice (NGINX/Apache excluded)
