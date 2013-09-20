From: Mathieu Belanger <m@thieu.so>
Subject: Re: Is it possible to speed up the command fsck.reiser4
Date: Fri, 20 Sep 2013 08:11:32 +0000
Message-ID: <20130920081132.Horde.Y-RztXjJvXUJYU-W3fifxw1@mail.thieu.so>
References: <1949faca7affee8130ee710c63d9e3eb@mail.velocitynet.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1949faca7affee8130ee710c63d9e3eb@mail.velocitynet.com.au>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset=; format=flowed; DelSp=Yes; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org


A build-fs probably read the whole disk to find what it need to  
rebuild (I did not check inside but it sound like that). After, if you  
add that for reading a fatty 2TB hard drive still go at the speed of a  
80GB drive, that will justify the time ;)

So if fsck go read the nodes "one at a time" and that you have  
something like a Western digital Grean 2TB, you end up with a nominal  
transfer speed of 56.6MiB/s with is about half the max because you  
miss one (slow)RPM of read, you end up with 609 minutes and so just to  
read the STORAGES TREE nodes...

If fsck read them "one at a time", it could be speed-up by doing a  
sequential read of the whole disk and using the ram for buffer to scan  
for theses nodes but it's not actually the priority (lot of thing are  
more important than the speed of fsck, for exemple FITRIM to keep our  
SSD fast).
