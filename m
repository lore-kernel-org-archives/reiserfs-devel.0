From: David Masover <ninja@slaphack.com>
Subject: Re: The situation at hand and in the future
Date: Sat, 29 May 2004 09:22:20 -0500
Message-ID: <40B89C9C.5050307@slaphack.com>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18902-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040528063324.GT4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Markus T=F6rnqvist wrote:
| Isn't the idea with Reiser4's crypto system that it uses cryptoalgos
| compiled into the kernel?

Sure, although it might be nice to allow userland crypto programs.  But
there's not all that many crypto algorithms, and most of them are in the
kernel -- so the only really nice thing that comes from that is the
ability to update them without rebooting (in case of some insecurity).
Not worth wasting too much time on right now.

| Of course these could be represented under ciphers. Actually, I'd
| be surprised if they're not under /proc/ or /sys/

The symlink is just my idea of a good way to represent references.  The
alternative here would be something like:

$ echo blowfish > cipher

This is analagous to providing a text entry box when you really want a
drop-down menu.  My suggestion for a filesystem-based "drop-down menu"
would be to have a directory full of files (which could easily be
completely empty).  You create a symlink to the one you want.

|>$ echo 256 > bitsize
|>$ echo 0 > block	# deny access rather than block if dir is accessed
|>before passphrase is entered
|
|
| What is the difference between blocking and denying access?

Blocking as in waiting for input.  Think like a program reading from
stdin.  It may think it's reading from a file that's already got all the
data it needs, but if stdin points to a terminal, it will stop and wait
for each line of text you enter.  Here, a program trying to access
~/.secret will sleep until someone does

$ echo (passphrase) > ~/.secret/..metas/crypto/passphrase

This might be nice while booting up, so that the user can enter the
passphrase whenever they feel like it without having to watch programs
die with "access denied" errors, and having to restart those programs.
But an init script run early enough in boot should take care of that
problem, and it'd be a lot more annoying if the user did something like

$ ls ~/.secret

and it sleeps for awhile, then the user goes "Doh!  Forgot to enter my
passphrase" and has to kill 'ls' and enter it.

What would be better is to simply deny any request to ~/.secret which is
not directly tied to accessing ~/.secret/..metas.

|>If it's possible, I'd like a bad passphrase to make 'echo' get an "acess
|>denied" error (or maybe block for one second first), but I don't see how
|>that's possible -- how do we know when the write is done and the
|>passphrase is entered until the file is closed?
|
|
| Adding a passphrase retroactively? The write is done, the file
| is closed, and only then is the file encrypted.

Yeah, that's fine, but then "echo" doesn't die.  This is fine for shell
scripts -- they can always detect that it didn't work out and try again.
~ But I would like both shell scripts and manual user munging to be well
supported.

|>I'd like all settings but passphrase and key to be persistant.
|
|
| Persistent over boots? I'd like the passphrase and key to survive
| a boot...

Reading ahead in my mail, I see this has already been answered.  Note
that cryptoloop does exactly what you're describing, only it allows an
incorrect passphrase to be entered, because it can't tell the difference
between correct or incorrect -- only you can, because incorrect will
yield gibberish.  We would want something to persist that allows a
passphrase to be checked.

|>performance (setting individual crypto settings for thousands of dirs)
|>would not do the steps I outlined from a shell script.  If a pseudo file
|
|
| Naturally. But if the crypto settings propagate automatically to new
| children, it may not be such a performance loss.

True, but it should be possible for people to design a system which
requires thousands of *individual* crypto settings (individual
passphrases and so on, so it can't all propegate to new children) -- not
because I can think why they'd do that, but because someone will
inevitably come whining to Namesys if they can't.

Not that this is a priority.

| I have lived in the belief that \0 is there to make things faster.
| I'm afraid I have to disagree here, but that's trivial semantics.

Meaning it shouldn't be hard to change.  And if we're writing shell
scripts, we don't want performance.  And if we want peformance, I'll bet
there's a lot more lost on having so many individual files than on
having a little bit of parsing.

| Besides, shell scripts take about the same time to write, I mean,
| it takes the same time for the human to write the script, has it

Maybe I don't want to write a script?  And manually editing the files
should be at least as easy as it is with /proc/sys and /sys files.
Those do not require a \0, chop off a trailing \n at the end of input,
and add one at the end of output.

| the strict \0 1/0 syntax or not. Maybe even one script or user-space
| reiser4prog would suffice for general cryptohandling.
|
| r4_encrypt ~/.secret/ -c sha1 -s 256 # and so on and so forth.

I can imagine something like this, but you can't count on having
something like that for every plugin in every situation.  Unless there's
a generic shell script, which seems like a waste.

| Ever since having read about Reiser4's implementation, cryptoloop has
| seemed like a terrible kludge, so I'm really looking forward to this
| better solution.

dm_crypt is a better solution than cryptoloop, but this is better still.

| GIMME GIMME GIMME! ;)

Amen.  Any code to start from?  Because I might even want to hack a
plugin together this summer.  Assuming it doesn't exist yet...


The original mail which this is in reply to a reply to was an attempt to
start being more consise, especially on mailing lists.  Oh well, I tried :P
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQLicnHgHNmZLgCUhAQIcoQ/+Pk08sL8479I5ZGULyv2ZVDbszU7DGczr
T5pTK9tkh2XRWMGhYcjByVHmdQzZncspLkyA+ULRShP4F15rQcJESSOgVGbWqbb2
nwubUierQhtuM7tMUGSCFxYbNnWdY7BCNenS/qCnSDwr2Ygf8XWpBWG7mkd+Z0+I
b5N8IqOK7dPg+YbxyWHJXirYHPoBqDCnFfSt1HC10eR+DDt505oR9GqUkNVo9ls0
6o9sfKj5bIEnsdHLb/CLGiloSpu9CISinCJS6xEA2twGGWyAogrLxpuYgjCqqel0
YqVc6z3R+PdBegq9PJt6rcTy098e+GimHPQfFz+ijfj/M+6+iquhDWL0DK46Nfde
7Xb8EYBXKN8VO1QpgCyDSrdT/ilSRnSHDbixo7MZGyScc0zjTjL/t96BMpwA4cb3
4upKhefEFlPm8ksP7GPXr3r//AbiFgykayFNfwE0gt34LIVCguVwkp/2nZELLsA7
HXnhLgSNJyrDCcviYbPdlMcNSYoJrXv2GDyNsX234XIhuzVrbLUOM4TdpKi6A3HU
pmwEEoUPduDG9S+h+6eiccX/LhAUo94mAfPZW5e+lxoi/+82W58lBcJaE0IQdU5h
mLVrnXiRJange1x5gE3D1a3uwDQrOi/Z9CJPL5mqHwVlVw/Gx3T6n7f/KlNf7SK5
oHylvIqYxJQ=3D
=3DAkCE
-----END PGP SIGNATURE-----
