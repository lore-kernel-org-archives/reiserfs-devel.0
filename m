From: Joe Feise <jfeise@feise.com>
Subject: Re: Reiser4 crash 2.6.16-mm1
Date: Mon, 27 Mar 2006 14:32:14 -0800
Message-ID: <20060327223214.5291.qmail@pv105234.reshsg.uci.edu>
References: <20060327214132.4074.qmail@pv105234.reshsg.uci.edu>
            <C68877DC-ED4F-4827-B6ED-2F5CFEFC8037@smartgames.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28366-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <C68877DC-ED4F-4827-B6ED-2F5CFEFC8037@smartgames.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Toby Thain <toby@smartgames.ca>
Cc: reiserfs-list@namesys.com

Toby Thain writes:
> 
> On 27-Mar-06, at 4:41 PM, Joe Feise wrote: 
> 
>> Hi,
>> I had an interesting crash on my 2.6.16-mm1 machine earlier today.
>> I usually mount /usr/local readonly:
>> /dev/sda6 on /usr/local type reiser4 (ro)
>> However, since I wanted to update a sw package, I remounted it r/w.
>> The installation of the sw package failed with reiser4 errors.  Sorry, I 
>> don't have a dmesg output at this point, I'll send that  tonight when I'm 
>> back at the machine.
>> But anyway, it reported index errors, and suggested running fsck.
>> I then ran an fsck.reiser4 --build-fs, which finished without  reporting 
>> errors.
>> In further tests, I mounted /usr/local rw from the start, and saw  the 
>> installation fail again. After that, /usr/local/lib was no  longer 
>> accessible.
>> To me, this looks like corruption of some in-memory data structures.
> 
> Have you run a memtest lately?

Thanks for the suggestion. I haven't run a memtest, but I don't really think 
that the memory is bad. The machine most likely would have had other issues 
if that was the case.
In any case, I will run a memtest tonight, just to make sure. 

 -Joe
