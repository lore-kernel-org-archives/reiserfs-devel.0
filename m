From: =?ISO-8859-2?Q?Jakub_Ambro=BFewicz?= <ja@vigor.com.pl>
Subject: Re: superblock problem
Date: Wed, 26 Jun 2002 15:30:02 +0200
Message-ID: <3D19C1DA.3070508@vigor.com.pl>
References: <3D19A3ED.6040201@vigor.com.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10855-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com

On 6/26/02 1:22 PM, Jakub Ambro=BFewicz wrote:
> So i thought maybe i used wrong version and tried
> all of the options, still no result. And now i stuck
I forgot to mention that two upper version options
of --rebuild-sb (ie 3.6.x and 3.5.9) resulted in
superblock beeing written at block 16. Two lower versions
wrote sb at block 2. But kernel still expected them to be
at block 8.

JA

