# Password Policy Setup

Objectively the most annoying part to memorize, out of the entire mandatory instruction set. I included some hints so you can do this in, like, 10 minutes tops.

We need a specific library to properly configure password requirements - `libpam-pwquality`
## Install `libpam-pwquality`

Install `libpam-pwquality`.

## Configure password aging

Set password aging conditions (`/etc/login.defs` | Hint: search for `PASS_MAX_DAYS` using `Ctrl + W` on Nano.)

## Configure password rules
Set password structure rules (`/etc/pam.d/common-password` | Hint: [Arch Docs](https://wiki.archlinux.org/title/PAM))

See how long this section is? Yeah. That's how complex this is. If you don't know how to do any specific part of PAM configuration, Google it. Google exactly what you want to do, in as little words as possible, using the relevant keywords. e.g: `linux pam enforce different digits from old password`
<br>
Adding a question mark or a 'how to' will not help you find what you want. KISS - <u>**K**eep **I**t **S**imple, **S**hithead</u>.