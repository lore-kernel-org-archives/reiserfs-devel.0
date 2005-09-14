From: Yiannis Mavroukakis <jander@darthvader.us>
Subject: Re: Interview with Hans on KernelTrap
Date: Wed, 14 Sep 2005 15:11:21 +0100
Message-ID: <43282F89.4020907@darthvader.us>
References: <878xy0sy0d.fsf@evinrude.uhoreg.ca> <432820E8.9080201@st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25953-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <432820E8.9080201@st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Peter Foldiak wrote:

> Hans, in the interview you give the example:
>
>  cat /home/reiser/mp3s/..../childcat > /dev/dsp
>
> to illustrate concatenation.
> [...]
>  
> The convention (I think also approved(suggested?) by Linus at some 
> point) could be that where you say
>
>  /home/reiser/mp3s
>
> you get a the file (or concatenation, if the directory has no "file" 
> content itself), but when you say
>
>  /home/reiser/mp3s/
>
> (with the trailing "/"), you get the directory.
>
If cool is the first perceived benefit, then why do it ? Besides, it's 
quite easy through force of habit or mistype to add a '/'

______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________
