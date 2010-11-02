From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Bug with KDE 4.5 and reiser4 2.6.34
Date: Tue, 02 Nov 2010 20:47:39 +0100
Message-ID: <4CD06ADB.9010307@gmail.com>
References: <201010310406.07767.volkerarmin@googlemail.com> <201010311502.34199.volkerarmin@googlemail.com> <4CCFE344.5050706@gmail.com> <201011021915.43139.volkerarmin@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <201011021915.43139.volkerarmin@googlemail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Volker Armin Hemmann <volkerarmin@googlemail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Volker Armin Hemmann wrote:
> Hi,
>
> On Tuesday 02 November 2010, Edward Shishkin wrote:
>   
>> find -inum 11052573
>>     
>
> I moved all the pictures in home in their directory and one of the errors - 
> 11052576 - is gone
>
> 11052573 exists and when kde tries to generate the thumbnails, dmesg is again 
> flooded. When I try to cat the file, I get an i/o error and dmesg is flooded even 
> more.
> About the fsck: when I do not pipe the output into stout.log, I can see the 
> spinner/progress bar moving and the procent going up, so fsck is doing 
> something. It just does not fix the problem. Is there some option to make fsck 
> show what it is doing?
>   

Ok, could you send me the packed metadata?
Such packing will cut the orphan clusters though...
Let's take a look why it doesn't print even consistency status.

Edward.
