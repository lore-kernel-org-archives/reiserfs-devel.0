From: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Subject: hashes in reiser3.6
Date: Thu, 18 Nov 2004 20:45:14 +0100
Message-ID: <2f4958ff041118114530134bff@mail.gmail.com>
Reply-To: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22414-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

Hi folks

I have a need to switch from default hashing to TEA on one of my
servers recently.
Want to write something like that, as it doesn't exists now. Only in
manual I digged out that hash= option to mount is just for folks who
want to upgrade their filesystem to 3.6, and choose hash, or
something.
If someone can tell me how deep I should dig to change it, and some
hints are welcomed.
I already did some hacking in reiserfs3.6 for myself (non profit
thing), so I know sources a bit.

Thanks in advance.

I know that reiser4 is supperb, and I am testing it extensively
(already found 2 or more bugs and reported them), but it is stilll way
to much unstable for production.

-- 
GJ
