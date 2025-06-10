# Monitoring Script
Finally. Something that actually requires two neurons and a non-severed connection between them.

*Note: Now's a good time to learn what a **shebang** is. You might also want to learn what the **`grep`**, **`xargs`**, **`uniq`** and **`wc`** commands do, along with **`cut`** (or **`sed`**, if you feel like challenging yourself). **`awk`** may also be convenient if you want to shorten down on the amount of lines.*
## Create your `monitoring.sh` script

This one's fun. Let's define what we need to display, how we can get that information, and how we can display it.

- ## **The What**:
	- Architecture, and Kernel Version (**Hint: These two are listed together for a reason. Google it.**)
	- Physical & Virtual Processors (**Hint: `/proc/cpuinfo/ | grep`.**)
	- Available RAM + usage in percentage (**Hint: `free -h` or `free --human`**)
	- Available storage + usage in percentage (**Hint: `df /`**)
	- CPU usage in percentage (**Hint: [top(1) Arch Wiki](https://man.archlinux.org/man/top.1.en), `top -h`**)
	- Date and time of last reboot  (**Hint: `who --help`**)
	- Status of LVM (enabled/disabled (no, simply hard-coding it to say "enabled" does not count.)) (**Hint: `lsblk`**)
	- Active server connections (**Hint: Google it. `linux check ssh connections`**)
	- Active users on server (no, it's not the same as active connections.) (**Hint: Google it. `linux check active users`**)
	- IPv4 & MAC Addresses (**Hint: Google it.**)
	- Number of commands executed with sudo (**Hint: Google it.**)

- ## **The How**: 
	<details><summary>Try figuring this out by yourself first. Please. I beg you.</summary>

	- Architecture: `uname -srm` (You could use `uname -a` but that displays information that is not requested on the subject.)
	- Physical Processors: `cat /proc/cpuinfo | grep "physical id" | uniq | wc -l`
	- Virtual Processors: `cat /proc/cpuinfo | grep "processor" | uniq | wc -l` (same as before, but this time you grep `processor` instead)
	- RAM:
		- Total: `free -m | grep "Mem" | xargs echo | cut -d' ' -f2`
		- Used: `free -m | grep "Mem" | xargs echo | cut -d' ' -f3`

	Now, here you need to decide whether you want to one-line this damn thing and feel like Linus Torvalds' strongest soldier, or make your code actually readable and spare your evaluator a few hours worth of trying to understand what the fuck you wrote.
	You can apply this for all the other elements that require displaying percentage.
	<br>
	Either way, the key process is the same: Divide free by total.
	### Pick your Path
	<details><summary> <b><i>You: Fuck it, we're one-lining. The evaluator can munch on my unwashed genitalia.</b></i></summary>
	<br>

	- First of all, you're unloved.	Doing this shit will not bring the kids back. But whatever. You wanna be the villain? Go for it.<br>
	- With that in mind, to "one line" this, we're gonna use ***`heredoc`***. This way, the only time we need to write a new line is when we want to actually output a new line with `wall`. If you're not familiar with `heredoc`, then you're definitely going to want to [read up on it](https://linuxize.com/post/bash-heredoc/).
	- Now that you've (hopefully) read up on it, the plan is simple: We run `wall` with a `heredoc` and in-line every specific call.
	- For memory, it'd look something like this:
		- ```
			wall << EOF
			(...)
				#	Memory Usage: $(free -m | grep "Mem" | xargs echo | cut -d' ' -f3)/$(free -m | grep "Mem" | xargs echo | cut -d' ' -f2)MB ($(awk "BEGIN {printf \"%.2f\",$(free | grep "Mem" | xargs echo | cut -d' ' -f3)/$(free | grep "Mem" | xargs echo | cut -d' ' -f2)*100}")%)
			(...)
			EOF
			```
	- Congratulations. No one want to evaluate you now. Nor sit with you for lunch. Nor have a coffee with you.
	<br> You brought this upon yourself. I warned you.
	<br> Go on, dipshit. Open the `monitoring.sh` in this directory. You know you wanna.

	<br></details>
	<details><summary> <b><i>You: Fine, you know what? I feel like being a tolerable human being today.</b></i></summary>
	<br>

	- Great! Thank you. Thank you, really. What was going to come from the alternative was not worth being shunned by multiple different rungs of your very own bloodline.
	- Since this process requires reusing previously stored information in slightly different formats, the best you can do here is rely on `bash` variables. 

	- Store

	<br></details>

</details>

## Setup automatic running at boot & every 10 minutes

For time-based program executions you always use `cron`. If you don't use `cron`, you may as well be vibe-coding this entire godforsaken project. Yes. This is a Sysadmin project. There's little to no code involved. That's how bad of a programmer you are.

For execution on boot, you have options, but the most objectively simple one is to use `cron` as well. If you don't want to use `cron`, that's fine, but in that case then you should be able to figure it out yourself.
<br>
And for the love of god. *<u>Don't use ChatGPT</u>*. You won't learn anything.

1. Enable `cron` (It's a service, I'll let you guess. Remember to use `sudo` and the `--now` flag.)
2. Open `cron` (`crontab -e`)
3. Write your cronjob(s) (Hints: [ArchWiki](https://wiki.archlinux.org/title/Cron), [Some random IT website](https://phoenixnap.com/kb/crontab-reboot))
