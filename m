From: Alexy Khrabrov <list+reiserfs@setup.org>
Subject: Re: dd/rebuild of a small used part of a huge reiserfs on lvm?
Date: Fri, 28 May 2004 03:06:45 -0400
Message-ID: <20040528070645.GA1309%alexy.khrabrov@setup.org>
References: <20040528062808.GA604%alexy.khrabrov@setup.org> <20040528064225.GB24446@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18886-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040528064225.GB24446@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>


Alex -- wonderful, thanks!  Doing rebuild-sb first and rebuild-tree second
on a truncated dd dump did get me one file in lost+found.  However,
there were two!  They both were in a directory, and I said rm * there.
The directory is still there, showing empty.  There were only these two
files in the directory, and nothing else was done to the file system
except cp and diff.  Where could the second file go if it's not in
lost+found?  Is there anything else to try?  Just curious...

-- 
Cheers,
Alexy Khrabrov :: www.setup.org :: Age Quod Agis
