From: Alexy Khrabrov <list+reiserfs@setup.org>
Subject: Re: dd/rebuild of a small used part of a huge reiserfs on lvm?
Date: Fri, 28 May 2004 03:29:00 -0400
Message-ID: <20040528072900.GA1653%alexy.khrabrov@setup.org>
References: <20040528062808.GA604%alexy.khrabrov@setup.org> <20040528064225.GB24446@backtop.namesys.com> <20040528070645.GA1309%alexy.khrabrov@setup.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18888-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040528070645.GA1309%alexy.khrabrov@setup.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>


Just to add, the file name in lost+found was 2572_2574.  There were
two large jpegs, about 4 MB each, and the recovered was one of them.
They were written one after another.  Can I do something based on the file
name, if it represents some block numbers range or something analogous?
Also, I know the names of the two original jpeg files.  Can that help?
Just curious...

-- 
Cheers,
Alexy Khrabrov :: www.setup.org :: Age Quod Agis
