From: Hans Reiser <reiser@namesys.com>
Subject: Re: www.namesys.com down
Date: Thu, 24 Jun 2004 09:13:02 -0700
Message-ID: <40DAFD8E.7010304@namesys.com>
References: <20040624090231.GB22482@favonius> <20040624091210.GG5080@backtop.namesys.com> <20040624144725.GA26097@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19344-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040624144725.GA26097@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sander@humilis.net
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com, "E. Gryaznova" <grev@namesys.com>

Sander wrote:

>Hi Alex,
>
>Alex Zarochentsev wrote (ao):
>  
>
>>On Thu, Jun 24, 2004 at 11:02:31AM +0200, Sander wrote:
>>    
>>
>>>I notice www.namesys.com is down for quite some time now. At first
>>>it was not pingable, but now just the webserver refuses to 'serve
>>>the web'. Is this due to the migration to reiserfs4?
>>>      
>>>
>>Yes. Yesterday we resolved apache2/reiser4 issue. Now the server is
>>reconfigured again.
>>    
>>
More precisely, it seems that all of our regression tests don't test 
sendfile.  We need to fix that.  grev, please look into it.

>
>Thank you for your answer.
>
>When do you think reiser4 is able to serve www.namesys.com again? I
>would like to try it for my own webserver, but if Namesys doesn't dare
>to, then I don't for sure ;-)
>
>Is there a list of know reiser4 issues online? A quick search on
>www.namesys.com didn't reveal it.
>  
>
There are none remaining, except performance drop due to ent threads 
needing to be optimized if we use them (and ent threads are needed for 
good iozone performance).

>        Kind regards, Sander
>
>
>  
>

