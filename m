From: David Masover <ninja@slaphack.com>
Subject: Re: The situation at hand and in the future
Date: Sat, 29 May 2004 18:16:47 -0500
Message-ID: <40B919DF.3040408@slaphack.com>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com> <20040529154917.GW4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18906-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040529154917.GW4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Markus T=F6rnqvist wrote:

| Symlinks have the good point that this doesn't happen:
| $ echo foobar > cipher

Oh yes, it does.
$ ln -s /tmp/foobar cipher

Of course, the nice thing here is that at least 'ln' refuses to create a
broken symlink, not sure about more low-level things.  But it does make
it easier for the user to manually set up a cipher.  Traditional /sys style:

$ cat ciphers
blowfish
3des
...
$ echo blowfish > cipher

My way:

$ ln -s ciphers/<tab><tab>
blowfish
3des
...

Now all the user has to do is a 'b<tab><enter>' to use blowfish.

| Of course that would be handled, but having you chasticed by the kernel
| may be bloating it. Is that a bigger bloat than handling symlinks out
| of the pseudo file system? Or maybe silent failures are good enough..

I was actually thinking that it would be nice for some of this to be
moved to userland anyway.  I mean, what's crucial to be in the kernel
(for speed reasons) is the filesystem and probably things like the
crypto api, individual ciphers, and whatever else is involved in the
actual operation.  The setup doesn't need to be in the kernel at all,
and in fact, I think it'd be nice to have a meta-plugin which exports
the plugin interface to userland, to make this sort of thing easier.

|>What would be better is to simply deny any request to ~/.secret which is
|>not directly tied to accessing ~/.secret/..metas.
|
|
| This reminds me of the point of encrypting a directory.
|
| I really want to know if it encrypts the directory object or all content.

Encrypting a directory should encrypt the directory listing, at least.
It would theoretically be possible to scan the disk for all files which
use that plugin (or is the plugin id stored in the directory?) so that
you know which files are encrypted, but then you don't know filenames or
the directory hierarchy.

If that's true, though, it means that in order to be sane, we have to
verify the passphrase.

|>|>If it's possible, I'd like a bad passphrase to make 'echo' get an "acess
|>|>denied" error (or maybe block for one second first), but I don't see how
|>|>that's possible -- how do we know when the write is done and the
|>|>passphrase is entered until the file is closed?
|>| Adding a passphrase retroactively? The write is done, the file
|>| is closed, and only then is the file encrypted.
|>Yeah, that's fine, but then "echo" doesn't die.  This is fine for shell
|>scripts -- they can always detect that it didn't work out and try again.
|>~ But I would like both shell scripts and manual user munging to be well
|>supported.

I was talking about the metafile editing.  If I do 'echo foo >
passphrase', and it's a bad passphrase, I think the 'echo' shouldn't be
successful.  Obviously not a priority, as either script or user can
check for a directory listing to make sure the passphrase was correct.

But your point is well taken:

| I'm afraid I don't see this situation quite clearly.
|
| You mean the file creation starts and echo for encrypting is issued
| before the write is done?
|
| I'm not sure about the syntax but I hope it's clear ;)
|
| $ cd .secret
| $ dd if=3D/dev/urandom of=3DKingArthur.0d.DivX.avi &
| [1] 2084
| $ (sleep 20; kill %1) &
| [2] 2085
| $ echo passphrase > crypto/passphrase
|
| A situation like this would be awkward...

Awkward to code, but not particularly awkward to figure out.  The 'echo'
command should block (sleep) until the directory has been encrypted,
assuming it was not encrypted to begin with.  Whatever 'dd' does over
the course of the encryption should be reflected in the eventual file.

As for coding it, we probably want a snapshot of the directory to
encrypt.  Atoms within the directory are not allowed to complete until
the encryption process is done.  Any changes to the directory or its
files should either block (the easy answer) or be stored as diffs to the
original snapshot (the right answer).

The easy answer works, but causes the problem of:  what if the user
starts this encryption of a fairly large directory (such as /), and then
needs to run something?  The encryption process is in the kernel, so we
don't crash, we just wait around for a very long time.

The right answer requires proper snapshotting.  I think how this works
is to make a copy of the file such that individual blocks are
copy-on-write, allowing us to take a snapshot of a huge file, change a
tiny piece of it, and use no more space than the chunk changed.  After a
little reflection, it would make sense to have all copies work that way.
~ It seems easier to make the whole file copy-on-write, but then we can't
handle huge files efficiently.

A (MUCH) simpler approach would be to make each file dirty and then set
it to be encrypted, as an atom.  This doesn't work for huge files,
though, because then we have to read the entire file into RAM before we
encrypt it.

If the crypto is implemented with snapshotting, it works like this:  You
start writing to foo.avi and it works as usual.  You start encrypting
stuff, and as a single atom, a snapshot is taken of foo.avi and it is
set to be encrypted.  The 'setting to be encrypted' basically forces all
future writes and reads to this file to be encrypted/decrypted where
they touch disk.  This is ok, because the blocks that are not encrypted
yet don't really belong to the new, encrypted file, and thus don't go
through the decryption plugin.

Now all we have to do is start reading in the non-encrypted blocks, and
writing them back on top of themselves as we go.  Ideally, we somehow
know which ones are not encrypted yet, and thus we don't end up
duplicating the work of new writes from dd (which are encrypted).
Practically, it may be implemented such that all blocks are read and
written to by the process -- which is ok, because each read/write pair
is an atom.  But on a big enough file with enough activity during the
encryption process, certain blocks would be encrypted twice, unless we
could check before encrypting a block whether it's already encrypted.

I still haven't read the reiser4 code, and so I don't know if this is
practical -- can blocks be that intelligent?  Maybe we need to implement
these "blocks" as subfiles, so that they can each have their own
plugin-id?  Maybe I've got entirely the wrong approach?

|>Reading ahead in my mail, I see this has already been answered.  Note
|>that cryptoloop does exactly what you're describing, only it allows an
|>incorrect passphrase to be entered, because it can't tell the difference
|>between correct or incorrect -- only you can, because incorrect will
|>yield gibberish.  We would want something to persist that allows a
|>passphrase to be checked.
|
|
| Absolutely.
| Having no cryptoloop experience, I'd probably have filed a bug report
| for this. It's broken behavior, feature or not :)

The "feature" here is increased security.  Hubert wrote about this, but
I don't find it's such a big deal.  However, since some people obviously
care enough, this should only be the default option, not the only one.

| HOWEVER!
| Anyone with sufficient knowledge may dig out the persistent metadata
| information from the fs, say, using dd.
|
| How would this be handled? Are MD5 hashes strong enough?

Don't know about md5, but how hard is it to brute-force the file itself?
~ How about some strong magic at the beginning of the file (perhaps a
checksum of the filename?) which can be used to verify (within reason)
that the passphrase worked?  How vulnerable are modern ciphers to
known-plaintext attacks?

| One other option would be for the kernel to generate a super-passphrase
| so it stores cryptoinformation using this passphrase, which is totally
| inaccessible to users, but it may cause breakage on unclean shutdowns.

How easy is it to hide something from the user, anyway?  I mean, if
loadable modules are supported, it all goes out the window -- simply
write a driver that reads all kernel memory by directly asking the
hardware for it.  That's assuming that you can't simply scan through all
the memory yourself.

|>True, but it should be possible for people to design a system which
|>requires thousands of *individual* crypto settings (individual
|>passphrases and so on, so it can't all propegate to new children) -- not
|>because I can think why they'd do that, but because someone will
|>inevitably come whining to Namesys if they can't.
|
|
| I would solve this by having the settings propagate to all unencrypted
| children and let the children be re-encrypted or whatever that changes
| the cryptosettings.

That's fine, but that's still thousands of passphrases to change.  But
yes, deal with it later.

|>dm_crypt is a better solution than cryptoloop, but this is better still.
|
|
| I think I must look into dm_crypt, but I don't think I'll be encrypting
| any of my files until the Reiser4 mechanism is complete.

dm_crypt is only slightly better than cryptoloop -- to the user, it's
basically the same, only not as broken.

| There is some code that I tried to read through.
| reiser4/crypt.c
| reiser4/plugin/cryptcompress.h
| reiser4/plugin/cryptcompress.c
|
| So it seems it will compress as well as encrypt. But I'm not sure about
| what all that code does. Should give you a start though.

Seems right, only compression doesn't fit my (attempt at) design of a
crypto plugin above.  Or it does, but it'd have to be adjusted, because
compressing something changes its size, while encrypting it doesn't.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQLkZ3ngHNmZLgCUhAQKk7Q//aOXz30G5ZE2RZi8We9jPvYcmFci3d60a
ml/EV+sNnQNOiVe8p65+XuXD3SdMwJYzQKjAP02mPLeI2zHHbb4XnzeZOKq+eGbo
N3NaZRmbfaXVlcyfuA9QOyVu0QIHEx95XZXuZ983ZdAETuK8FcQFDHf3hTaGgw9g
qkyLpttHsdvdYC9Kbil7iFYOUll7q4EzYWwUo7HwIjAtkREgAMx6mMnNqtQlGOfc
xZl65PDU80kGquXtZ3DoaYS4rWzRO+XsTxEi3bPu1rq/+vWFbd5MZTCUrphbBiJ7
BeRgdzoncTreKJMpq1uqlg2iyb1097WTQ8zAmzWP3UhqDwsFiSqt4ZmA+GZuBFre
r70EN5UqYv6TI3yoNaDz25RXoWRToki/CnrUrSWKgyfQj3z2Qs1KUgC1FFQsGyUq
CkhyiEBbRAcsOFUBt1Z+jIOg3tJ5OyOsKisw1u2ycE0cg/XMTDTAB+wbHPhfknRa
K2Qe6bi9WXoa738wbdOcbWuL9ZNvudstO9kY7jcKym+2EX8640yTrDnJY1hy4rEg
ncEY565yyEHjl+F0Bz1Qq/9A9VRITogEpVHwXYbm0KCKDLYbMKEB/WEcikL31R4c
2E9ImUsaWbbCr6YNBjBscRejjUUJN/AHj0pat9dYPLRsAui9sVZswndqDjIxB3QT
wUCt28tFh74=3D
=3DgVEx
-----END PGP SIGNATURE-----
