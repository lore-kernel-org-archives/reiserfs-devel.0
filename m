From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: The situation at hand and in the future
Date: Sun, 30 May 2004 15:27:13 +0300
Message-ID: <20040530122713.GX4990@nysv.org>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com> <20040529154917.GW4990@nysv.org> <40B919DF.3040408@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18911-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40B919DF.3040408@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

On Sat, May 29, 2004 at 06:16:47PM -0500, David Masover wrote:

>Now all the user has to do is a 'b<tab><enter>' to use blowfish.

This is good. And if the user uses sh or ash which seem to lack
tab expansion, they inherently pay attention to typing.

Besides, only Linux is supported for now and it tends to provide
better shells by default.

>I was actually thinking that it would be nice for some of this to be
>moved to userland anyway.  I mean, what's crucial to be in the kernel
>(for speed reasons) is the filesystem and probably things like the
>crypto api, individual ciphers, and whatever else is involved in the
>actual operation.  The setup doesn't need to be in the kernel at all,
>and in fact, I think it'd be nice to have a meta-plugin which exports
>the plugin interface to userland, to make this sort of thing easier.

The pseudo file system is kernel-space.
Having something completely user-space creates yet another knob
to worry about?

What do you propose this will look like?

>Encrypting a directory should encrypt the directory listing, at least.

Yes, the directory listing is in the pseudo file system, so this
should be relatively easy to do.

Is readdir() so that it reads the same thing as 
cat ..metas/something/dirlist?

>It would theoretically be possible to scan the disk for all files which
>use that plugin (or is the plugin id stored in the directory?) so that
>you know which files are encrypted, but then you don't know filenames or
>the directory hierarchy.
>
>If that's true, though, it means that in order to be sane, we have to
>verify the passphrase.

Should be doable.

>| $ cd .secret
>| $ dd if=/dev/urandom of=KingArthur.0d.DivX.avi &
>| [1] 2084
>| $ (sleep 20; kill %1) &
>| [2] 2085
>| $ echo passphrase > crypto/passphrase
>| A situation like this would be awkward...
>Awkward to code, but not particularly awkward to figure out.  The 'echo'
>command should block (sleep) until the directory has been encrypted,
>assuming it was not encrypted to begin with.  Whatever 'dd' does over
>the course of the encryption should be reflected in the eventual file.

We agree.

>As for coding it, we probably want a snapshot of the directory to
>encrypt.  Atoms within the directory are not allowed to complete until
>the encryption process is done.  Any changes to the directory or its
>files should either block (the easy answer) or be stored as diffs to the
>original snapshot (the right answer).

Timothy Webster asked about this and Vladimir Savliev replied No.

I think these snapshots should be implemented here.

>The easy answer works, but causes the problem of:  what if the user
>starts this encryption of a fairly large directory (such as /), and then
>needs to run something?  The encryption process is in the kernel, so we
>don't crash, we just wait around for a very long time.
>
>The right answer requires proper snapshotting.  I think how this works
>is to make a copy of the file such that individual blocks are
>copy-on-write, allowing us to take a snapshot of a huge file, change a
>tiny piece of it, and use no more space than the chunk changed.  After a
>little reflection, it would make sense to have all copies work that way.
>~ It seems easier to make the whole file copy-on-write, but then we can't
>handle huge files efficiently.
>A (MUCH) simpler approach would be to make each file dirty and then set
>it to be encrypted, as an atom.  This doesn't work for huge files,
>though, because then we have to read the entire file into RAM before we
>encrypt it.

Could there be a compromise?
Like with the policy=smart mount option.

Take the easy way where it's more efficient, the right way when it's
more efficient.

It should be possible to evaluate the amount of free RAM and swap
and the size of the directory and then automagically decide how to
do it.

Maybe the following mount options:
cryptopolicy=smart
cryptopolicy=wait
cryptopolicy=dirty
cryptopolicy=snapshot

I just wonder where else these snapshots could be used...
Then again, it's basically copy-on-capture. So even if CoC doesn't
present much in the way of speed-up, it may present much in the
way of other functionality.

>Now all we have to do is start reading in the non-encrypted blocks, and
>writing them back on top of themselves as we go.  Ideally, we somehow
>know which ones are not encrypted yet, and thus we don't end up
>duplicating the work of new writes from dd (which are encrypted).

This is problematic, yes?

If the journal is updated atomically on writes of complete files,
we would either have completely encrypted or completely unencrypted
files?

>Practically, it may be implemented such that all blocks are read and
>written to by the process -- which is ok, because each read/write pair
>is an atom.  But on a big enough file with enough activity during the
>encryption process, certain blocks would be encrypted twice, unless we
>could check before encrypting a block whether it's already encrypted.

But if this could be in the journal, it would make life easier.

>I still haven't read the reiser4 code, and so I don't know if this is
>practical -- can blocks be that intelligent?  Maybe we need to implement
>these "blocks" as subfiles, so that they can each have their own
>plugin-id?  Maybe I've got entirely the wrong approach?

I'm afraid I couldn't make this out of the code.
But see below for more.

>| Absolutely.
>| Having no cryptoloop experience, I'd probably have filed a bug report
>| for this. It's broken behavior, feature or not :)
>The "feature" here is increased security.  Hubert wrote about this, but
>I don't find it's such a big deal.  However, since some people obviously
>care enough, this should only be the default option, not the only one.

But if the user is asked to retrieve encrypted data for another user
from an encrypted fs, say some shared environment, this may happend:
The user enters a faulty passphrase, gets gibberish data, he believes
it's correct because it's something funky like binary measurement data
which he doesn't understand, delivers it to the requesting user who
can't do anything with it.

Likely? Hell, no.

>Don't know about md5, but how hard is it to brute-force the file itself?
>~ How about some strong magic at the beginning of the file (perhaps a
>checksum of the filename?) which can be used to verify (within reason)
>that the passphrase worked?  How vulnerable are modern ciphers to
>known-plaintext attacks?

I can't remember how MD5 works. It's a 32-byte 7-bit hash of data?
It has also something to do with the length of the data, if you know
how long the data is, it's easier to do a successful birthday attack.

I've been thinking about doing a simulator for this in Python, but
when I don't even get enough sleep to make writing, or thinking in 
English easy, it will have to wait :)
I'd be interested in how to birthday an MD5 with the wrong assumption
about data length. Hopefully it is impossible.

Someone more security-oriented may want to give info here :)

What you propose is probably good for performance too, just see
if (decrypt(name) == decrypt(gethashedname(name))) or something..

It would still have to be a set-length hash so that we can reserve a
static amount of disk space for the headerish data.

>How easy is it to hide something from the user, anyway?  I mean, if
>loadable modules are supported, it all goes out the window -- simply
>write a driver that reads all kernel memory by directly asking the
>hardware for it.  That's assuming that you can't simply scan through all
>the memory yourself.

But this would require root privileges. If you can't trust your root,
who can you trust?

Isn't some memory always accessible by root solo? Or at least owned
by the user, you, so no-one else can access it? If a bug that circumvents
this gets into the kernel, certain sysadmins will start farting blood.

But that's assuming I remember the initial conditions correctly.

>| So it seems it will compress as well as encrypt. But I'm not sure about
>| what all that code does. Should give you a start though.
>Seems right, only compression doesn't fit my (attempt at) design of a
>crypto plugin above.  Or it does, but it'd have to be adjusted, because
>compressing something changes its size, while encrypting it doesn't.

Nor mine.

I would tend to bite the bullet and split compression and encryption
into separate plugins.

Are all encryptions set-length? (Is that an official security term?)

Maybe there is some way of doing the compression after and before
encryption and decryption, yes.

-- 
mjt

