From: David Masover <ninja@slaphack.com>
Subject: Re: Directory updates in filesystems
Date: Fri, 29 Oct 2004 00:26:18 -0500
Message-ID: <4181D47A.9050609@slaphack.com>
References: <1098955408.29128.TMDA@h34.zynet2.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22209-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1098955408.29128.TMDA@h34.zynet2.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Simon Waters <simonw@zynet.net>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Simon Waters wrote:
[...]
| If you have multiple processes simultaneously accessing a directory with
| rename of contents (additions and removals add more fun), a simple
| opendir/readir loop will on occasion fail to find a file that exists
(i.e.
| the stem part of the file name is the same) because the file has been
| renamed, on most filesystems on most *nix like systems tested.

If this is about locking not working well with NFS, why not ensure that
the directory itself is owned by root and read-only before attempting?
Wait -- don't answer that...

| Are there any file systems that fully address this issue, or POSIX
calls that
| guaranteed to make an atomic readdir, without specific locking, or must a
| lock be obtained on the directory to ensure that the read is
consistent. I
| think that locking is needed in the application if complete
consistency is
| required because the underlying behaviour of the OSes/filesystems is so
| variable in this regard, but I'd be interested in understanding what
| characteristics a filesystem would have to have to avoid this.

Maybe an atomic readdir operation?  Does reiser4 do atomic reads?

I know reiser4 (or at least should by 4.1) have a sys_reiser4 api which
does atomic write operations.  That is:  application starts the
transaction, does a bunch of writes, ends the transaction.  If at any
point there is a failure, filesystem tells application to roll back.

<rant>

Actually, though I can see the design decision to roll back, I think
that under certain circumstances, the new transaction should be required
to be complete before being comitted on top of the old state, and that
meanwhile, apps should be allowed to read the consistent, old state.
Like how vim, maildir, and many other things work now -- write to temp
file, rename temp file on top of original, only at the filesystem level
and for entire directories.

This alows read-only access, such as a web server, to operate on
slightly stale "snapshots" as this would create.  When faced with a
decision of:

- - serving a slightly stale page immediately
- - making users wait for a write of a newer version to complete
- - serving a half-written newer version

I am sure most web admins would choose the first option, which is what
they would get if the pages were being updated with vim.  The difference
is that the filesystem solution works on larger units than single files.

This would eliminate the need for application-level rollback support,
though that might be a nice feature.  Also, applications aren't always
available -- maybe mysql or some such was in the middle of a transaction
when my box crashed and my boot sector died, and maybe mysql will never
be on any rescue disk, and maybe I want my rescue disk to be able to
roll back the transactions for me and give me a consistent filesystem.

Obviously this fails if the readdir is part of a larger,
do-something-to-all-files-in-directory operation.  In this case, the
filesystem needs to know the difference between read and read/write
transactions -- read-only access need not lock, read/write must lock,
even if the write may not be necessary (write to file a if and only if
file b exists.)  It also implies that applications need to specify what
to lock.

I haven't really done my homework, but I think that the transactions I
just described are what databases do, and that the ones already in the
reiser4 whitepaper are easier.  Specifically because of that "specify
what to lock" thing.

The nice thing about this is that it gives fully scalable snapshots,
assuming all programs support it.  For example, a traditional snapshot
of a system with lots and lots of random activity in temporary files
will use a lot more resources than necessary, especially if you only
wanted one directory.  This solution gives you a solution as simple as a
patched cp or rsync which can work on anything from a single file to a
whole filesystem.  I'd like to see some benchmarks, but I think
filesystems are getting to a point where they will be more efficient
than humans at organizing data, meaning no real performance reason for a
bunch of tiny little partitions.  It'd suck to have to have a separate /
partition, just so you can atomically back up /etc.

| I think a lock and full read will have significant performance
implications,
| since the problem only manifests itself on busy directories, but in a
| journalled metadata environment all it wants is a consistent read, if we
| later stat the file and it is missing we can look for renamed versions.

~From what I can gather, it seems you'd be happy with the above system,
using read-only transactions in place of locks.

Before I completely run away with my ego, I have absolutely no idea how
difficult this would be to implement on top of reiser4, or anything
else, for that matter.  Also, even if the filesystem in question was
done today, it still might be awhile before application support was
developed enough for it to work -- how can I atomically back up /etc
while a package manager is installing, if said package manager doesn't
know about those locking/transactions?

</rant>

Don't let my ranting discourage you from Reiser or Linux in general.
Most geeks know how to be concise...
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQYHUeHgHNmZLgCUhAQLuchAAkbo3Ac9ikvfayhlT6M1CDjxAHEU3rTfH
7u50czApG8srLPH6tj6xOV9FT++g1KYhAeeNoGj9nKsFlgNJex3Wx4DqGbOZcUNW
sM3tbGCLrKiPtD8UJLrMc4ZQ7jDTI9AavGCA/Y4U8xGzbQSwOrFOdBeMqV3EXctT
ZycOkTXkfWGYKTQ8FEfxBPAEADsdpCQ4RiOgMuL9wy/V/LY5CdzhVlRJwNLf7UJy
sR+z2eKt97Tlg3opylT2R9AgNGmveMIfpDuN3F4IuMMHRZNDgrzWEYSHT208O8+A
2ZJkOU7yaPShdgt+tTD411hlXMMlSoKoCwhCzr9js9Fj1ice5a/DxXAryZJZPXoi
SxI2vrtm10gEEJ8TfbKDNhh50xTSCC6Jwgd8AuoN6f7GPojM6dpby6kXSMRfp/+A
nb4Oz6kdbAG9PhPaBFBjMC/GGakXelnBO98C8M5YvQ8Uc1X/Gi0zD+UQrN/m0xy+
v/fCJ7ySzBjQVBsKAXZenfrn/RB98zzqNVaMOeoA8hITbCQu9LOgHCbfZaYplUTl
bMJvUU2Pfuk9JCV6sZAwcoQAt1xKku+mzFcnvHXRmvRKlTA6ySMZRqVosXJbgXpa
2fhzJHDRZNUtMsQEy8QGbsUUCcFXHM/4gSRqNzI0r2uljwVxg1WBm/t2vBPudCPF
q0r+lpJTn/s=
=k5Cr
-----END PGP SIGNATURE-----
