From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: file as a directory
Date: Mon, 29 Nov 2004 23:11:34 +0000
Message-ID: <41ABACA6.2090900@st-andrews.ac.uk>
References: <200411292120.iATLKZxE004233@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22625-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411292120.iATLKZxE004233@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, linux-kernel@vger.kernel.org

Horst von Brand wrote:

>... or just people groping in /etc/passwd wanting to find the whole
>entry (not just one field),
>
the whole entry for joe would be
/etc/passwd/joe

> or perhaps look at the 15th character of the
>entry for John Doe.
>  
>
something like
/etc/passwd[fullname = "John Doe"]/character[15]
? what is so mad about that?  Peter
