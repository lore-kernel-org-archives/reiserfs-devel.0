From: Asheesh Laroia <asheesh@asheesh.org>
Subject: Re: Conversion from v3.6 to v4 of Reiserfs...
Date: Tue, 24 Feb 2004 21:25:20 -0500 (EST)
Message-ID: <Pine.LNX.4.58.0402242120330.13298@renaissance.laroia.net>
References: <20040224172153.M90659@pk25.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16917-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <20040224172153.M90659@pk25.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Diaz Rodriguez, Eduardo" <ediaz@pk25.com>
Cc: reiserfs-list@namesys.com

There is the program convertfs:
	http://tzukanov.narod.ru/convertfs/

I don't think it suports reiser4, but you could probably write a patch or
ask the author nicely.  It's supposed to do in-place filesystem conversion
by using a sparse loopback file.

I've only heard good things about it, but I've never used it.

-- Asheesh.

-- 
"Good health" is merely the slowest rate at which one can die.

On Tue, 24 Feb 2004, Diaz Rodriguez, Eduardo wrote:

> Sorry for the question from a newbie but I can'f find the answer and I find in
> google maillist and may sites...
>
> I recently upgrade from 2.4.20 kernel to 2.6.3 kernel my debian testing.
>
> I see in logs that my lvm system are using version 3.6 of resiser fs.
>
> Feb 23 21:57:12 servidor1 kernel: found reiserfs format "3.6" with standard
> journal
> Feb 23 21:57:12 servidor1 kernel: Reiserfs journal params: device dm-0, size
> 8192, journal first block 18, max trans len 1024, max batch 900, max commit
> age 30, max trans age 30
> Feb 23 21:57:12 servidor1 kernel: reiserfs: checking transaction log (dm-0)
> for (dm-0)
> Feb 23 21:57:12 servidor1 kernel: reiserfs: replayed 23 transactions in 1 seconds
> Feb 23 21:57:12 servidor1 kernel: Using r5 hash to sort names
>
>
> I want use new version v4 but I don't want to lost my data. are there any form
> to convert my fs to a new version v4??? This files are not critical for the
> system, only data..
>
> Thanks for the time and for reiserfs...
