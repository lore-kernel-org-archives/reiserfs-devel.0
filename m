From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 for windows
Date: Sun, 16 Jan 2005 00:07:51 -0600
Message-ID: <41EA04B7.3050606@slaphack.com>
References: <20041204211059.41930.qmail@web50908.mail.yahoo.com> <41B287C6.2060902@namesys.com> <41B29491.20405@slaphack.com> <41E9D3DF.1060508@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23157-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41E9D3DF.1060508@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Job Bob <yzhang2004@yahoo.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
[...]
|
|>
|> To start with, ntfs read access is still case insensitive, last I
|> checked.  How deep does that go?
|
|
| In reiser4, it is just a directory plugin.

Nono -- how do you give Windows, which is case insensitive, access to a
case-sensitive filesystem?  For instance, how do you get a Windows-based
backup program to back up a reiser4 partition from a Linux installation,
if it has filenames that are identical except for case?

Or is compatibility not an issue?

|> All this leaves me with the distinct impression that it'd be cheaper to
|> buy some gigabit ethernet (or fibre) and a Linux CIFS/Samba fileserver
|> using reiser4.  Steam and others refuse to install on network drives,
|> Windows probably will not boot off a network drive, but I imagine that
|> fixing these would be easier than porting a filesystem.

This was awhile ago, and I forget a lot of the context, but I'm
re-reading this and I agree with myself.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQeoEtngHNmZLgCUhAQLEjA//QP63NbMvczSfz1YE+EZ/9WqwdE1Wtl/i
YbqSd2r/nZaCcluoIMO6CXN780m7lqSBBTEH05gaHkNuqqxIuupSvLG5YexuDltB
FQtz856AEp29+OtRz691Z+YYCzowJSI6OmHvS6PXviRlv1JBvi2q8e8d0mG+37sT
VhIS3xMOovbJsR7CaOJiJZTbzvE+nIG5iGzU0/gtMFyXOLq6oxN6GJ6yuwbr4dYr
s6uEy7BF/AivwARfTxqrgLeMQVd+kQ3YTV9ACLKuXz60+eO98TXtNVNM/FbnvIr/
Fj4S3yHFN78z02lIR8FKlm6ZaqlS8yXGCfL7aE3NHZWtqySFXdlReJeSKp4YokAo
oqYAFbXuJ0ZIACRYEAbyEpVsvdKwLUuahlVmM4xK6P+WuZUHIxbyeWXyXrfbZ2D/
3k10zIUP47DJM/WO70Fn2G4X/anowk+PRM0bRI6KSJOMH1KTFi9hrjb3NxqV9o9p
KoDl+QYQQpJg30fEHNSkY5lUEMjd2od7R3DgzfkVi2nA/fCqZufHirGLFjWTyrDe
fvTy/CCP4W4oTZR4CHULADQn5bL1BqBm7RJDkF48HBbGKbEyEelhKgxHITC8VUFv
DQ7vIOq7oZ7F59L78ZGLRIvNaZVCB0BITmYZWfCX3SjaFMjDAVxrP8FlyOMjSMyt
T5P7Lte1kz0=
=L++4
-----END PGP SIGNATURE-----
