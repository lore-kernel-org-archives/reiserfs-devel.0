From: Hans Reiser <reiser@namesys.com>
Subject: Re: power loss -> corruption
Date: Thu, 08 May 2003 23:31:08 +0400
Message-ID: <3EBAB07C.5020005@namesys.com>
References: <m1k7d11yaz.fsf@orchid.mirar.org>	<200305081348.42359.Dieter.Nuetzel@hamburg.de>	<m1fznp1w3a.fsf@orchid.mirar.org>	<200305081502.47455.Dieter.Nuetzel@hamburg.de>	<m17k911sq4.fsf@orchid.mirar.org> <3EBAA8DB.3080202@namesys.com> <m14r45xn2i.fsf@orchid.mirar.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14029-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m14r45xn2i.fsf@orchid.mirar.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mirar <mirar-yg@mirar.org>
Cc: =?ISO-8859-1?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, reiserfs-list@namesys.com

Mirar wrote:

>Hans Reiser <reiser@namesys.com> writes:
>
>  
>
>>You have run into the disadvantage of meta-data journaling, which is
>>that files that you are writing to may be corrupted if you crash.
>>    
>>
>
>Hmm, I guess the main problem here is the atomicity? 
>I haven't studied traditional journaling very much. I somehow find it
>odd that the wrong block can get in the wrong files... shouldn't at
>least that be in the metadata?
>
Hmm, the right block got into the file, but the contents of that right 
block never reached disk because of the crash, does that make it easier 
to understand the problem?;-)


-- 
Hans


