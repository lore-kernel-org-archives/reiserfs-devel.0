From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: The situation at hand and in the future
Date: Sat, 29 May 2004 18:49:17 +0300
Message-ID: <20040529154917.GW4990@nysv.org>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18903-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40B89C9C.5050307@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

On Sat, May 29, 2004 at 09:22:20AM -0500, David Masover wrote:
>Sure, although it might be nice to allow userland crypto programs.  But

Correct me if I'm wrong, but that would mean interfacing the kernel
with the user in ways that may break more easily than just using
in-kernel algos?

>Not worth wasting too much time on right now.

Yeah.

>The symlink is just my idea of a good way to represent references.  The
>alternative here would be something like:
>$ echo blowfish > cipher

Yes. This springs to mind the pretty axiomatic notion that in order
to change a cipher from non-none, it must be unlocked :)

>This is analagous to providing a text entry box when you really want a
>drop-down menu.  My suggestion for a filesystem-based "drop-down menu"
>would be to have a directory full of files (which could easily be
>completely empty).  You create a symlink to the one you want.

Symlinks have the good point that this doesn't happen:
$ echo foobar > cipher

Of course that would be handled, but having you chasticed by the kernel
may be bloating it. Is that a bigger bloat than handling symlinks out
of the pseudo file system? Or maybe silent failures are good enough..

>Blocking as in waiting for input.  Think like a program reading from
>stdin.  It may think it's reading from a file that's already got all the
>data it needs, but if stdin points to a terminal, it will stop and wait
>for each line of text you enter.  Here, a program trying to access
>~/.secret will sleep until someone does
>
>$ echo (passphrase) > ~/.secret/..metas/crypto/passphrase
>
>This might be nice while booting up, so that the user can enter the
>passphrase whenever they feel like it without having to watch programs
>die with "access denied" errors, and having to restart those programs.
>But an init script run early enough in boot should take care of that
>problem, and it'd be a lot more annoying if the user did something like
>
>$ ls ~/.secret
>
>and it sleeps for awhile, then the user goes "Doh!  Forgot to enter my
>passphrase" and has to kill 'ls' and enter it.

No matter what, I think the user will echo the passphrase and have
to program wake up from sleep.

But this is a nice feature, which I hope again will be implemented.

>What would be better is to simply deny any request to ~/.secret which is
>not directly tied to accessing ~/.secret/..metas.

This reminds me of the point of encrypting a directory.

I really want to know if it encrypts the directory object or all content.

>|>If it's possible, I'd like a bad passphrase to make 'echo' get an "acess
>|>denied" error (or maybe block for one second first), but I don't see how
>|>that's possible -- how do we know when the write is done and the
>|>passphrase is entered until the file is closed?
>| Adding a passphrase retroactively? The write is done, the file
>| is closed, and only then is the file encrypted.
>Yeah, that's fine, but then "echo" doesn't die.  This is fine for shell
>scripts -- they can always detect that it didn't work out and try again.
>~ But I would like both shell scripts and manual user munging to be well
>supported.

I'm afraid I don't see this situation quite clearly.

You mean the file creation starts and echo for encrypting is issued
before the write is done?

I'm not sure about the syntax but I hope it's clear ;)

$ cd .secret
$ dd if=/dev/urandom of=KingArthur.0d.DivX.avi &
[1] 2084
$ (sleep 20; kill %1) &
[2] 2085
$ echo passphrase > crypto/passphrase

A situation like this would be awkward...

>Reading ahead in my mail, I see this has already been answered.  Note
>that cryptoloop does exactly what you're describing, only it allows an
>incorrect passphrase to be entered, because it can't tell the difference
>between correct or incorrect -- only you can, because incorrect will
>yield gibberish.  We would want something to persist that allows a
>passphrase to be checked.

Absolutely.
Having no cryptoloop experience, I'd probably have filed a bug report
for this. It's broken behavior, feature or not :)

HOWEVER!
Anyone with sufficient knowledge may dig out the persistent metadata
information from the fs, say, using dd.

How would this be handled? Are MD5 hashes strong enough?

One other option would be for the kernel to generate a super-passphrase
so it stores cryptoinformation using this passphrase, which is totally
inaccessible to users, but it may cause breakage on unclean shutdowns.

Wouldn't protect against hardware theft either. Naah, bad idea :)

>True, but it should be possible for people to design a system which
>requires thousands of *individual* crypto settings (individual
>passphrases and so on, so it can't all propegate to new children) -- not
>because I can think why they'd do that, but because someone will
>inevitably come whining to Namesys if they can't.

I would solve this by having the settings propagate to all unencrypted
children and let the children be re-encrypted or whatever that changes
the cryptosettings.

If that's not good enough, deal with it later.

Sure it iterates a lot over the tree in vain, but maybe the Reiser4
syscall API would allow these to be better bundled together.

Requiring some cool reiser4progs addition which uses this API.
And then someone would write a Python module so someone with skills
as lacking as mine can write a sexier application ;)

>Meaning it shouldn't be hard to change.  And if we're writing shell
>scripts, we don't want performance.  And if we want peformance, I'll bet
>there's a lot more lost on having so many individual files than on
>having a little bit of parsing.

Mmyeah, perhaps you're right.

Maybe it should be homogenized to \n and let it slide.

>| r4_encrypt ~/.secret/ -c sha1 -s 256 # and so on and so forth.
>I can imagine something like this, but you can't count on having
>something like that for every plugin in every situation.  Unless there's
>a generic shell script, which seems like a waste.

I was thinking more along the lines of a c program (which is basically
a shell script ported to c, think djb's makemaildir or whatever it was
called) which would do lookups of available cryptoalgos and stuff.

A glorified shell script. A generic one. Even if it were a waste.

>| Ever since having read about Reiser4's implementation, cryptoloop has
>| seemed like a terrible kludge, so I'm really looking forward to this
>| better solution.
>dm_crypt is a better solution than cryptoloop, but this is better still.

I think I must look into dm_crypt, but I don't think I'll be encrypting
any of my files until the Reiser4 mechanism is complete.

I like easy solutions and having it on the fs is just too damned simple :)

>Amen.  Any code to start from?  Because I might even want to hack a
>plugin together this summer.  Assuming it doesn't exist yet...

There is some code that I tried to read through.
reiser4/crypt.c
reiser4/plugin/cryptcompress.h
reiser4/plugin/cryptcompress.c

So it seems it will compress as well as encrypt. But I'm not sure about
what all that code does. Should give you a start though.

Unfortunately the error codes in the code are named Edward, who doesn't
appear in the README...

>The original mail which this is in reply to a reply to was an attempt to
>start being more consise, especially on mailing lists.  Oh well, I tried :P

Consistency is a bit like perfection.
A good goal but the distance to it shortens only in halves.
Close enough is good enough.

I'm doing yet another bk -r get now, as the last one didn't compile.
I don't think much has developed during the weekend, but if there's
a 24 hour latency there's also hope :)

(Rumor has it the nightly snapshot system will come next week ;)

-- 
mjt

