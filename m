From: Terje Malmedal <terje.malmedal@usit.uio.no>
Subject: Re: reiserfs and nfs.
Date: Tue, 26 Nov 2002 11:12:25 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <E18Gchd-0005jx-00@aqualene.uio.no>
References: <15842.28332.47095.407177@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-reply-to: <15842.28332.47095.407177@laputa.namesys.com> (message from
	Nikita Danilov on Mon, 25 Nov 2002 21:40:44 +0300)
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita@Namesys.COM
Cc: linux-kernel@vger.kernel.org, Reiserfs-List@Namesys.COM


[Nikita Danilov]
> Terje Malmedal writes:
>> 
>> [Nikita Danilov]
>> > Terje Malmedal writes:
>> >> 

> [...]

>> 
>> To reproduce do something like: 
>> $ ls -li RMAIL
>> 387607 -rw-------    1 tm       4050     36635726 Nov 20 16:15 RMAIL

> Is RMAIL inode number constant on the server?

No, it is always the same as the number seen over NFS, but I've not
seen this problem when I've tried running emacs on the nfs-server
itself.

-- 
 - Terje
malmedal@usit.uio.no
