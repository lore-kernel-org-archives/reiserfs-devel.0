From: Boyd Waters <bwaters+mac@aoc.nrao.edu>
Subject: Re: metas Permission Denied
Date: Thu, 29 Apr 2004 14:39:50 -0600
Message-ID: <5C8CA275-9A1D-11D8-8CFE-000A95C88606@aoc.nrao.edu>
References: <E38393BE-9950-11D8-B39A-000A95C88606@aoc.nrao.edu>	<16528.46352.173184.528623@laputa.namesys.com>	<39CF0546-99EE-11D8-8CFE-000A95C88606@aoc.nrao.edu> <16529.9818.916980.360020@laputa.namesys.com> <409129D4.6050703@namesys.com>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18297-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <409129D4.6050703@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>


On Apr 29, 2004, at 10:14 AM, Hans Reiser wrote:

> Nikita Danilov wrote:
>
>> "x" bit is necessary for lookups, and "r" bit---for readdir.
>>
> Didn't someone send us a fix for this problem which separated the 
> permissions?  Remeind me what the problem with that was.....?
>


I must agree that the "r" bit should be sufficient to view the 
pseudo-subdirs on a file, no matter what the "x" bit setting.

The traditional semantics of the 'x' bit on directories is awful; 
Banyan Vines had an explicit 'scan' attrib on directories for this, and 
I believe Windows has something as well. Some way to express 
"permission to descend into this directory" as opposed to "permission 
to readdir() this directory". Something that is NOT the 'x' bit. Would 
be perhaps too awful or impossible to add to POSIX, I don't know.

In any event, the semantics of the 'x' bit on FILES is very clear: this 
is an executable file.

You run into trouble when you want to make a file look like a 
directory, but the thing IS_A file -- and therefore the "file-x-bit" 
semantics should shadow any "dir-x-bit" behavior.

The 'read' bit should let you look at the "sub-dirs" of a file!

Thanks!

~ boyd

Boyd Waters
National Radio Astronomy Observatory
Socorro, New Mexico

