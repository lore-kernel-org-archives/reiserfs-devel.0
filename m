From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: dd/rebuild of a small used part of a huge reiserfs on lvm?
Date: Fri, 28 May 2004 12:41:11 +0400
Message-ID: <200405281241.11333.vitaly@namesys.com>
References: <20040528062808.GA604%alexy.khrabrov@setup.org> <20040528070645.GA1309%alexy.khrabrov@setup.org> <20040528072900.GA1653%alexy.khrabrov@setup.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18889-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040528072900.GA1653%alexy.khrabrov@setup.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexy Khrabrov <list+reiserfs@setup.org>, ReiserFS List <reiserfs-list@namesys.com>

On Friday 28 May 2004 11:29, Alexy Khrabrov wrote:
> Just to add, the file name in lost+found was 2572_2574.  There were
> two large jpegs, about 4 MB each, and the recovered was one of them.
> They were written one after another.  Can I do something based on the file
> name, if it represents some block numbers range or something analogous?
> Also, I know the names of the two original jpeg files.  Can that help?
> Just curious...

If you made a copy of the whole device, you would probably get 
both them back. Otherwise the manual search through the fs metadata
can be done: debugreiserfs -DU /dev/xxx | less
If you need our assistance here, please visit our support page.
-- 
Thanks,
Vitaly Fertman

