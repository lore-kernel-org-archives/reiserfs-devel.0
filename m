From: Valentine Sinitsyn <Valentine.Sinitsyn@usu.ru>
Subject: Re: acl lists
Date: Wed, 19 Oct 2005 17:10:57 +0600
Message-ID: <854149994.20051019171057@usu.ru>
References: <33003b0d0510190403m39c647d1icc499f8572e58d9e@mail.gmail.com>
Reply-To: Valentine Sinitsyn <Valentine.Sinitsyn@usu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26566-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <33003b0d0510190403m39c647d1icc499f8572e58d9e@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pan Hektor <listywww@gmail.com>
Cc: reiserfs-list@namesys.com

Hello,

PH> Hello.
PH> I'm a student. I want to know how are acls handled in reiserfs,
PH> and how=A0 does that affects rwx permissions.
PH> Any infromation would be useful.=20
PH> Generally I'm interested in all linux filesystems which supports ACL li=
sts.
PH> Thanks
PH> Piotr.
PH> =A0
ACLs are supported in all major Linux filesystems: ext2/3, ReiserFS,
XFS and JFS. I haven't used them with ReiserFS so can say nothing on
interactions between ACL and standard Unix permissions. AFAIK, they
complement each other but not substitute, i.e. if some file has 0700
permissions and write ACL for mary:group, you can write to this file
if you are: either it owner or mary.

Best regards,
Valentine



