From: Jindrich Makovicka <makovick@gmail.com>
Subject: Re: Reiser4 cowardly panic 2.6.17-mm5
Date: Sun, 2 Jul 2006 07:09:00 +0200
Message-ID: <20060702070900.56567aa5@holly.localdomain>
References: <44A6FA33.1000305@feise.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28889-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44A6FA33.1000305@feise.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: jfeise@feise.com

On Sat, 01 Jul 2006 15:41:55 -0700
Joe Feise <jfeise@feise.com> wrote:

> I consistently get cowardly panic errors during bootup with
> 2.6.17-mm5 (I also had that with -mm3, and had hoped -mm5 would have
> fixed it.) It corrupts the partition this is happening on (/var)
> I don't have dmesg or syslog output, though, since this happens
> during bootup, and /var gets corrupted...

With -mm5, I had a reiser4 panic during umounting, but I forgot to take
a screenshot either, and don't want to mess my fs by running it again.
It was during rebooting after syslog shutdown, so no syslog entry. So
far I stick to 2.6.17-rc4-mm3, as the recent mm's tend to
lose (not only because of reiser4 problems).

-- 
Jindrich Makovicka
