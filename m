From: Yury Umanets <umka@namesys.com>
Subject: Re: slow mount
Date: Thu, 12 Jun 2003 18:18:36 +0400
Message-ID: <3EE88BBC.1080508@namesys.com>
References: <1055427629.1875.8.camel@terminus.zapto.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14527-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1055427629.1875.8.camel@terminus.zapto.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Herbie Hopkins <Herbie@Hopkins.net>
Cc: reiserfs-list@namesys.com

Herbie Hopkins wrote:

>It seems to take a very long time to mount a large reiserfs filesystem:
>
>  $ time mount /home
> 
>  real    0m17.259s
>  user    0m0.000s
>  sys     0m0.000s
>
>  $ df -h
>
>  Filesystem            Size  Used Avail Use% Mounted on
>  [snip]
>  /dev/hda7              44G   12G   33G  26% /home
>
>is this normal behaviour? as this drastically increases my system statup
>time. The same partition formatted to ext3 mounts in less than a second
>and this also seems to have no reflection on the amount of data on the
>partition as it still takes this long when the filesystem in empty.
>
>Any help would be appretiated, thanks.
>Herbie
>
>
>
>  
>
Bitmaps are read in mount time. And this realy does not depend on data 
amount, only on filesystem size.

-- 
Yury Umanets
"We're flying high, we're watching the world passes by..."



