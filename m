From: Oleg Drokin <green@namesys.com>
Subject: Re: Copy time comparison 2.4.20-pre6 <-> 2.4.19+data-logging (was:Compatibility of  current 2.4.19.pending ...)
Date: Thu, 19 Sep 2002 20:01:30 +0400
Message-ID: <20020919200130.A18305@namesys.com>
References: <20020914130239.D26664@namesys.com> <3D867C14.5060404@mb.tu-ilmenau.de> <20020917103321.C25766@namesys.com> <3D87347D.8030504@mb.tu-ilmenau.de> <20020917180035.A15755@namesys.com> <3D8768DB.1030102@mb.tu-ilmenau.de> <20020918092012.A20063@namesys.com> <3D892510.2000602@mb.tu-ilmenau.de> <20020919103453.A14104@namesys.com> <3D89F2AF.3080806@mb.tu-ilmenau.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11511-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D89F2AF.3080806@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Thu, Sep 19, 2002 at 05:52:15PM +0200, Manuel Krause wrote:

> >>Yes, it fits. I know that problem with this RAM based test. Though I may 
> >>increase the testing directory a bit closer to the OOM limit, having 
> >>512MB available.
> >No, this is not enough of course since some data will remain unflushed and
> >amount of such data is relatively big compared to total amount of data.
> And if the participating filesystems are umounted after writing the data?

Then it is ok of course. All fs' buffers are flushed on umount.

> >But here is another warning:
> >I presume before each copy test is done, /mnt/beta/z.Backup.3 is removed
> >completely and /mnt/beta is unmounted and mounted back, also
> >between sevetral writing attempts (And during these attempts of course)
> >no other processes can write to to this FS.
> These clauses are both true and apply to the dd tests, too. Mmh, except 
> for the case when /mnt/beta/z.Backup.3 or testfile.zero were the source 
> to be copied/dd'ed... There haven't been overwrites or other writes to 
> the disk during the testsets.
Ok, good.

> >I presume you earased /mnt/beta/testfile.zero between tests and executed
> >sync.
> I umounted the partition and mounted it back. I thought that would be 
> the right action to avoid what you describe in the following:

Yes.

> >I thought that original data is residing on another filesystem on another 
> >disk.
> >If originally you vere copying data from one disk to the same disk, just
> >another partition, then thisis just lots of seeks.
> Thanks for these reminders. Originally I wanted to copy data from one 
> disk to another and on the way capture the timings to compare the 
> throughput... Then you pointed me to re-check pure reads and pure writes 
> mainly to make sure the writes were not read-speed bound and to compare 
> this behaviour on -pre6 and -pre7.

Originally I was mostly interested in reads from source fs, not the one
where you have copied the data (though that one is also might be useful).

Ok, thank you for lots of testing.

Bye,
    Oleg
