From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: df -h and reiser4
Date: Thu, 4 Sep 2003 14:40:42 +0400
Message-ID: <16215.5802.834350.119989@laputa.namesys.com>
References: <sf56652e.095@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15545-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <sf56652e.095@gwia201.syr.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Konrad <mkonrad@syr.edu>
Cc: reiserfs-list@namesys.com

Michael Konrad writes:
 > I'm not sure if this is a df or reiser4 issue.
 > 
 > When running df -h, the output is as follows 
 > df: `/mnt/lfs': Value too large for defined data type

Yes, it is reiser4 issue (to some extent) and it will be fixed in the
next snapshot.

 > 
 > Regards,
 > Michael
 > 

Nikita.
