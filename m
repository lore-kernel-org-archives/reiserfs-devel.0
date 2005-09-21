From: Edward Shishkin <edward@namesys.com>
Subject: Re: Which compresion algorithms are planned?
Date: Wed, 21 Sep 2005 12:37:04 +0400
Message-ID: <43311BB0.1010700@namesys.com>
References: <885127441.20050920234356@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26197-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <885127441.20050920234356@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pysiak Satriani <pysiak.satriani@wp.pl>
Cc: reiserfs-list@namesys.com

Pysiak Satriani wrote:

>Hi,
>
>recent threads on compression made me think about the algorithms.
>Will there be just one compression algorithm for everything,
>or many and ways to choose from them?
>
>Will it be possible to, say, write plugins of your own to do
>the compression?
>  
>

Hello.
Reiser4 will be able to support all compression and block-ciphering 
algorithms,
(even asymmetric ones which inflate data with the keys of max lenght 65K).
Supporting an algorithm means having an appropriate transform plugin. 
Most likely
it is a wrapper for the famous GPL code of some ingenious persons ;)
 

>Which algorithms are considered for compression?
>  
>

lzo1 and gzip1 for the first time

>Best Regards,
>Maciej
>
>
>
>
>  
>

