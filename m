From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: 2 Terabyte install
Date: Wed, 12 May 2004 11:24:40 -0700
Message-ID: <1084386280.6257.31.camel@ipso.snappymail.ca>
References: <409AC2FF.7080800@lindows.com>
	 <1083917932.14089.281.camel@tribesman.namesys.com>
	 <409BB690.6030604@namesys.com> <409BBDC9.3030809@lindows.com>
	 <409FB387.8080804@namesys.com> <40A19147.4010703@lindows.com>
	 <40A257DA.2010903@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18632-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40A257DA.2010903@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Clifford Beshers <clifford.beshers@lindows.com>, Vladimir Saveliev <vs@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Vitaly Fertman <vitaly@namesys.com>

On Wed, 2004-05-12 at 09:59, Hans Reiser wrote:
> > There were a few bugs of ours that acted as red herrings, but Linspire 
> > is now up and running on this system with ReiserFS 3 and kernel 2.6.5.
> >
> > While I'm here, I have some other questions:
> >
> >     * What is the time complexity of mounting a ReiserFS partition? 
> >       It seems to be proportional to the size of the partition?  Is it
> >       different for Reiser4?
> >     * Is there a tool to determine the type of file system on a
> >       partition without mounting it?
> >
> is the time a problem in practice, or just a curiousity point?

Hans,

	The last place I worked had a 2.5TB RAID array that had 10's of
millions of files on it, basically a perfect fit for ReiserFS. However
they rejected it simply because of the mount times. It was a slower
machine (mainly used for dumb storage, however uptime was critical) but
the mount times were just crazy, I don't have hard numbers, but if I
recall correctly I was told around 5-10 minutes. 

Basically it made it so just kernel upgrades due to newly found exploits
in a single year had the potential to breach the SLA's we had with
customers, simply due to ReiserFS mount times. :(

Obviously RAID arrays are getting larger and larger these days, uptime
is critical, and reboots are a part of life when it comes to security
and being on the internet. If ReiserFS V4's mount time is proportional
to the size of the partition, I can see that being a huge concern for a
lot of people. Especially people in large data centers where SLA's are
signed with every customer, and minutes of downtime could mean writing
cheques to customers. 

It would be a shame to see a masterpiece like ReiserFS V4 be rejected in
large storage situations due to something as trivial as mount times. Is
there anything that can be done to speed up mount times on ReiserFS's V3
or V4?

Thanks.

> 
> > Cliff
> >
> > Hans Reiser wrote:
> >
> >> Clifford Beshers wrote:
> >>
> >>> Thanks Hans, but no need.  I found the page in the FAQ about three 
> >>> minutes after I posted.  I get so used to google finding me the 
> >>> right things, I occasionally forget to just go to the place I know 
> >>> should have the answers.
> >>>
> >>> So far, I know that sfdisk choked on creating the partition, but 
> >>> that fdisk succeeded.  After that the install proceeded normally, 
> >>> but the system didn't reboot.  I have to go get details on why, but 
> >>> my guessis either lilo or a missing module in the initrd.
> >>
> >>
> >> If you want us to research the problem source for you further, let us 
> >> know.  Be  suspicious of the device driver....
> >>
> >>>
> >>> Hans Reiser wrote:
> >>>
> >>>> Vladimir Saveliev wrote:
> >>>>
> >>>>> Hello
> >>>>>
> >>>>> On Fri, 2004-05-07 at 02:58, Clifford Beshers wrote:
> >>>>>  
> >>>>>
> >>>>>> What are the current size limitations for 
> >>>>>> disks/partitions/filesystems
> >>>>>> with the following combinations?  My googling has produced
> >>>>>> inconsistent answers.
> >>>>>>        { linux 2.4.24, linux 2.6.5 } X { reiserfs3, reiser4 }
> >>>>>>   
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>> http://namesys.com/faq.html#reiserfsspecs
> >>>>>
> >>>>>  
> >>>>>
> >>>>>> We have a new machine with a 3-ware 8 port controller (looks like a
> >>>>>> scsi controller to the system, but actually drives 8 ide 
> >>>>>> drives).  We
> >>>>>> have 8 x 300GB drives attached for a total > 2TB.
> >>>>>>
> >>>>>> Our IT guy has been unable to install Linspire on it (linux 2.6.5,
> >>>>>> reiserfs3).  I'm about to go look in more detail, but I thought I'd
> >>>>>> find out what the bounds were for sure.
> >>>>>>
> >>>>>>   
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>> I assume mkreiserfs was not the reason why you guys failed to install
> >>>>> linux on your hardware. It works for > 2tb devices.
> >>>>>
> >>>>>  
> >>>>>
> >>>>>> Thanks,
> >>>>>>
> >>>>>> Cliff
> >>>>>>
> >>>>>> -- 
> >>>>>>
> >>>>>> This message contains information which may be confidential and 
> >>>>>> privileged. Unless you are the addressee (or authorized to 
> >>>>>> receive for the addressee), you may not use, copy or disclose to 
> >>>>>> anyone the message or any information contained in the message. 
> >>>>>> If you have received the message in error, please advise the 
> >>>>>> sender and delete the message.  Thank you.
> >>>>>>   
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>  
> >>>>>
> >>>> Please provide exact answer to this question about what are V3 
> >>>> limits.  Vitaly, please assist.
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>


