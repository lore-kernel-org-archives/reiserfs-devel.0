From: jenn sirp <sirp1@llnl.gov>
Subject: Re: repost for readdir
Date: 24 Jun 2004 12:30:31 -0700
Message-ID: <1088105431.2573.40.camel@murdock.llnl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19359-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Please consider working with V4, it will be easier and more useful I
think.

I plan to. I read the documentation on-line about the plug-in capability
of your FS -- very cool. And I have the rest of the summer to poke
around with this idea. 

My questions are related to the implementation from a performance
perspective... If readdir is the only function to be altered... it seems
there would be a bit of a performance hit because a linear search, or
binary at least would need to be performed every time. 

I am also not certain as to how to determine 'when' the file was created
I assume it would need to be determined from the inode creation time?

I am just looking for some general pointers as to implementation of this
would best be achieved. I thought that maintaining another structure
somewhere else in the code, that preserved filenames as they were
written into the FS, would speed up readdir. 

Hopefully some of that makes sense ; )

Jenn 

