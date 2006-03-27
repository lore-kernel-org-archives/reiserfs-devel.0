From: Marcus Furlong <furlongm@hotmail.com>
Subject: Re: 2.6.16 patch
Date: Mon, 27 Mar 2006 21:10:01 +0100
Message-ID: <e09dad$f0p$1@sea.gmane.org>
References: <4417D43A.2070603@namesys.com> <3aa654a40603150459q25507248v54f4ffef5e41042d@mail.gmail.com> <44185E04.5030307@namesys.com> <44267AAE.60201@free.fr>
Reply-To: furlongm@hotmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-list-return-28359-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

jp wrote:

> I would like to know when I can expect the reiser4 patch to be available
> for vanilla 2.6.16 ?

There is a unofficial clean-up of the 2.6.15 patch here:

https://www.cs.tcd.ie/~furlongm/reiser4/2.6.16/

along with a clean-up the enable-metas patch.

It applies to vanilla 2.6.16, but it doesn't contain any of the fixes in -mm
(e.g. don't build as a module without applying the export symbol patches in
-mm). It's working ok for me.

Marcus.

