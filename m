From: Nick Vahalik <nick@nsanity.com>
Subject: Re: Reiserfs Data Recovery
Date: Wed, 10 Mar 2004 10:54:24 -0600
Message-ID: <404F4840.5090407@nsanity.com>
References: <404E8665.7090305@nsanity.com>	 <1078918871.9476.116.camel@tribesman.namesys.com>	 <404F2F51.5000205@nsanity.com> <1078932372.9476.133.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17166-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078932372.9476.133.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Vladimir Saveliev wrote:

>Are you using reiserfsck from
>ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.13.tar.gz?
>
>If yes - please run
>debugreiserfs -p /dev/problemdevice | bzip2 -c > problemdevice.bz2
>and make problemdevice.bz2 available for downloading.
>
>It should allow us to fix reiserfsck bug.
>
>If you are using older rieserfsck (reiserfsck -V), please try with the
>one of
>ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.13.tar.gz
>  
>
root@bardiel:~/reiserdata# debugreiserfs -V
debugreiserfs 3.6.13 (2003 www.namesys.com)

root@bardiel:~/reiserdata# debugreiserfs -p /dev/sda1 | bzip2 -c > 
devsda1.bz2
debugreiserfs 3.6.13 (2003 www.namesys.com)
 
Loading on-disk bitmap .. 38677079 bits set - done
super block..ok
bitmaps..(1228).. ok
journal (from 18 to 8210)..ok
Super block, bitmaps, journal - 9422 blocks - done, 38667657 blocks left
0%....20%....40%....60%....80%....100%                       left 0, 
15211 /sec
Packed 66463 blocks:
        compessed 63534
        full blocks 2929
                leaves with broken block head 55
                corrupted leaves 83
                internals 672
                descriptors 0
data packed with ratio 0.09

The meta-data info can be downloaded at 
http://24.162.126.168:8080/devsda1.bz2
~5.3 MB

Thanks

Nick Vahalik

