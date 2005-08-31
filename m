From: evilninja <evilninja@gmx.net>
Subject: Re: Wikipedia article
Date: Wed, 31 Aug 2005 19:00:27 +0200
Message-ID: <4315E22B.6030507@gmx.net>
References: <e692861c05082922152447fbf7@mail.gmail.com> <4315E01B.5050007@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25757-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4315E01B.5050007@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs List <reiserfs-list@namesys.com>

evilninja schrieb:
> - Maximum filename length
> - Maximum pathname length (currently "No limit defined" <-- is this true?)

in the thread "REISERFS_MAX_NAME and ENAMETOOLONG" it is stated, that max.
filename length is not a kernel limit but a libc limit of 255 chars.
right? an in the same thread PATH_MAX is named to be the limit for "max
pathname lenght", which is currently 4096 bytes.

i just wonder why almost all other fs are listed with "255 bytes" for max
filename lenght and "No limit defined" for max. pathname lenght...

i shall update the wikipedia entry if no objections are filed...
Christian.
-- 
BOFH excuse #217:

The MGs ran out of gas.
