From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Recommended Journal Size for Small FS?
Date: Sat, 06 Mar 2004 21:38:54 -0800
Message-ID: <404AB56E.1020203@matchmail.com>
References: <200403061835.15983.warren@cs.queensu.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17110-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403061835.15983.warren@cs.queensu.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jared Warren <warren@cs.queensu.ca>
Cc: reiserfs-list@namesys.com

Jared Warren wrote:
> (Please excuse me if this has already been answered, I couldn't find anything 
> pertinent in a brief archive search.)
> 
> I would like to use ReiserFS on my / filesystem, which includes bin, etc, lib, 
> sbin, and root. Right now the files on that partition only take up 40 MB, so 
> it seems like a 32 MB journal is overkill. Some comments I've read recommend 
> using ext3 on small file systems because supposedly the journal is 
> proportional (I have been unable to find out what proportion), however I 

It should be less than 5MB (I think ext3's mkfs will scale down to 1 or 
2MB depending on size).
