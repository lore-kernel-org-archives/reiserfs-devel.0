From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: The situation at hand and in the future
Date: Thu, 27 May 2004 23:01:27 +0300
Message-ID: <20040527200127.GS4990@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18878-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi

I reinstated the reiser part of my page:
http://mjt.nysv.org/reiser/

The broken package is here:
http://mjt.nysv.org/reiser/bk-2004-05-25/

With the screenshots (courtesy of my Siemens SX1, which decided it won't
crash while taking pictures) and the config on the top level.

It's uploading still and will be doing so for quite a while, but if you
see a tarball there, it's completely uploaded, because I'll have made
the tar :) Or then I'll go to sleep and I will make a tar when needed.
Maybe only vmlinux is enough for debugging.

I'm also doing a new, clean, bk clone/get.

That is not what I figured to mail about though.

I'm afraid I'll reopen a can of worms here. But hopefully compensate
with something that may arouse discussion of practical issues.

I'm sure we all know about Hans' attitude toward xattrs. As I said before,
I don't care which API is in or out as long as it works for me, and I
hope the better one wins.

Now, considering the state of the union, maybe it might be a wise strategic
move to back off a bit from that. The pseudo file API is really near
completion, right? All I don't see are the compression and crypto plugins.

The following paragraphs may be a bit flawed, depending on how much a
difference there should be between the pseudo files API and the syscall
API. Looking at the web page, the ACLs seem to be the biggest issue.

So, the Reiser4 API is good for providing passphrases for encrypted files
and directories, right? Because using echo to unlock them from the file
system is hazardous?

Why not add user-space programs which basically do what echo does, but
with the terminal echo turned off? They would probably size at around
0k and would use the pseudo file API.

Maybe this would be a use case:
1. Joe wants to encrypt the files he l33ch3d from kazaa at work.
2. Joe chdirs to the pseudo directory under ~/Work/Warez/
3. Joe says echo 3DES\0 > plugin/crypto
4. Now the directory knows it must be 3DES-encrypted, but it needs
   a passphrase.
5. Joe says echo TOPSECRETPASSWORD\0 > plugin/cryptokey
6. The file system works its magic

Now every file Joe downloads under ~/Work/Warez/ is automatically
encrypted with the provided phrase.

Joe then decides that his work documents might be good to encrypt as
well.

7. chdir again
8. echo BLOWFISH\0 > plugin/crypto
9. echo THEOTHERPASSWORD\0 > plugin/cryptokey
10. The encryption kicks in and encrypts the directory (contents?)

Does that, btw, encrypt the directory object or it and its children?
With fibration the new children are fibrated as per the parent directory's
settings, right? So this should be the same with every plugin?

~/Work/Warez/ should still be left untouched, no matter what happens,
because it has a different algorithm.

Files which contain passphrases must be write-only and hopefully even
have the passphrase expire on some idle time.

Now Joe needs to access the files as well.
This is where it gets trickier...

No matter what happens, the software accessing encrypted data must support
some api.

11a. echo TOPSECRETPASSWORD\0 > plugin/cryptounlock
     This would unlock the directory, naturally the cryptoplugin could not
     be changed to none without the data being unencrypted to boot.

11b. echo PID-TOPSECRETPASSWORD\0 > plugin/cryptounlock
     This would grant access to one certain PID.
     
What happens when Joe is a SuSE or Mandrake user, who just wants to
clickety-click his way through these procedures?

Solution 1: Have a graphical pseudo file manager as a separate project,
            maybe just start it and let someone else finalize and admin it.
Solution 2: Contribute, or have someone else contribute, code to popular
            graphical file managers.

The question arises, is it possible for a pseudo file to know which pid
is accessing it?

What happens if you want to use Apache or some other program that has
close to n+1 processes, maybe specify the PPID?

Also, it might be clearer if the plugin file crypto were a plugin directory
crypto, with files in it like "algorithm", "passphrase", "unlock" or
something?

The same use case would apply with compression algorithms, I suppose?

This did not really get us very far from the can of worms, however.

If all this is doable like this, or done better than my suggestions, from 
the base of meta files, why bother with the Reiser4 syscalls API now?

Seems to me like a waste of resources, financial and human, and time.
I never tried them, but xattrs were in Reiser4, at least to some extent,
so would it be possible to re-integrate them and start working on the
syscalls later on?

I think, if possible with little work, xattrs could be pushed quicky in.
Maybe left there as "the crappy alternative"
Also, I think Chris Mason said the ReiserFS xattrs were implemented as
files? Or have I misunderstood/forgotten? Maybe Reiser4 xattrs could
be implemented as pseudo files? And maybe I should see for myself
some day...

Stuff like sequencing I/Os and file access without descriptors
can't be done with xattrs? That's how I interpret this. So the syscalls
must come.

Will the syscalls, or I wish much more the pseudo files, enable stuff
like retroactive inheritance of parent plugin settings?

All I'm aiming at here is to minimize work and provide some ideas of
how to get quick community acceptance, so if the xattrs advocation
seems like worthless provocation or annoying rambling, it was not my
intent and if I just made an innocent fool of myself, I can live with
that :)

Also, some hints at what the future will bring would be good. Like,
what's the next Big Thing? If the mmap bug and NFS are fixed, the
next logical things to attack would be:
* Re-sustain stability and performance (The loss which I can not estimate
  since the bugger crashes on mount :)
* The pseudo files API, more closely crypto and compression.
* Copy-on-capture
* Reiser4 syscalls

Apart from the social aspect of getting it out to the public, for which
only the first, or first two, are required.

What is Hans' take on those attacks?

Thanks and I hope at least some reaction comes from this mail :)

-- 
mjt

