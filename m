From: Hans Reiser <reiser@namesys.com>
Subject: Using fs views to isolate untrusted processes: I need an assistant
 architect in the USA for Phase I of a DARPA funded linux kernel project
Date: Sun, 01 Aug 2004 18:20:28 -0700
Message-ID: <410D96DC.1060405@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19910-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

You can think of this as chroot on steroids.  The idea is to use the 
concept of views, in which one specifies a description of what in the fs 
should be visible in the view, and extend them to become "tracing views" 
which automate the creation of "viewprints", which contain what a 
process attempted to access during some period when it was being 
supervised, and then use these viewprints to conveniently specify a view 
that defines what the process should be allowed to access.  It is not 
that this is better than chroot, it is that it is to be made much less 
human work to use than chroot, as chroot is used much too rarely in 
practice.

Another concept of the proposal is that of process oriented security, as 
opposed to the object oriented security usual to filesystems.  These 
viewprints will be associated with the executables of the processes 
being isolated, not with the files, and this is academically amusing as 
a distinction I think.

You can find details of our proposal at 
www.namesys.com/blackbox_security.html.  You have to be able to perform 
the work in the US (a government requirement for this contract), which 
means that I cannot use my current Russian staff (the US State 
department is making it hard to get visas these days).

If you have an interest in filesystems, views, security, and the linux 
kernel, you might find it fun.  It should be a nice opportunity for an 
ambitious young software architect, and I like to think that the people 
who work for me learn a bit.  The infrastructure you will help spec out 
will be useful for lots of other purposes besides security (version 
control, search refinement, etc.)  The work will be GPL'd, etc.

If you would like to know more about namesys and reiser4, you can look 
at www.namesys.com

Please email me directly if it interests you rather than just responding 
to the thread.

Hans
