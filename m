From: Eddie Atherton <stunnel@attglobal.net>
Subject: Re: Question about system lock-ups
Date: Sun, 06 Jan 2008 16:48:34 -0800
Message-ID: <478176E2.7090309@attglobal.net>
References: <477EFB41.4070600@attglobal.net> <47816309.10803@gmail.com>
Reply-To: stunnel@attglobal.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47816309.10803@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org


> I had something similar on my dual athlon 1700+ box.
> Getting rid of case has fixed the problem, so I didn't
> investigate this further ;)
>
Hmmmm.  This is a dual Opteron setup

> For example, pushing the "big red button" when write is in progress..
>
Except the last writes to the disk were hours before the button was 
pushed.  Plus, I doubt there would be that many writes active at that 
moment.
>> Now, here's the really weird part.  hda2 is an UNUSED partition.  It 
>> isn't mounted on the system:
>>
>> Filesystem            Size  Used Avail Use% Mounted on
>> /dev/hda1             9.3G  3.5G  5.9G  37% /
>> /dev/hdb2             187G  164G   24G  88% /usr/local/NotYet
>> /dev/hdb3              47G   18G   30G  37% /usr/local/Apps
>> /dev/sda5             233G  140G   93G  61% /usr/local/Music
>> /dev/sda6             233G  173G   60G  75% /usr/local/Backup
>> tmpfs                 256M   68K  256M   1% /tmp
Any thoughts on this part.

Cheers,
Eddie
