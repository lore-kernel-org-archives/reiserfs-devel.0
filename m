From: Hans Reiser <reiser@namesys.com>
Subject: Re: file as a directory
Date: Tue, 14 Dec 2004 21:31:51 -0800
Message-ID: <41BFCC47.4050700@namesys.com>
References: <200412141930.iBEJUGdB019336@laptop11.inf.utfsm.cl> <41BFC2FC.80905@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22775-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41BFC2FC.80905@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

David Masover wrote:

>
>
> Remember that a filesystem is a specialized database. It is specialized
> for performance. 

Yes, this is exactly right.  The reason earlier efforts to generalize 
filesystems failed was performance, and the reason performance reduced 
was a lack of hard work on the problem.

