From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: file as a directory
Date: Mon, 29 Nov 2004 22:59:31 +0000
Message-ID: <41ABA9D3.7020602@st-andrews.ac.uk>
References: <200411292120.iATLKZxE004233@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22624-reiserfs=m.gmane.org@namesys.com>
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

>Now think about files with other formats, for instance the (in)famous
>sendmail.cf, or less structured stuff like you find in /etc/init.d/, or
>just Postgres databases (with fun stuff like permissions on records and
>fields)... or just people groping in /etc/passwd wanting to find the whole
>entry (not just one field), or perhaps look at the 15th character of the
>entry for John Doe.
>
>This way lies utter madness (what format description should be applied to
>what file this time around?). Plus shove all this garbage into the kernel?!
>  
>

I was suggesting this idea mainly form XML files, where the tags define 
the parts clearly.
In addition, I was suggesting that some of the XPath syntax (normally 
used for within-XML selection) could be extended above the file level 
into the file system.
The problems you mention are all related to non-XML file format issues, 
which was only a minor comment in parenthesis in my original mail. I am 
happy to do it only for XML to begin with (and if possible later see if 
it can be done for SOME non-XML formats).  Peter
