From: Hans Reiser <reiser@namesys.com>
Subject: Re: zam, please discuss this
Date: Wed, 23 Jun 2004 20:33:46 -0700
Message-ID: <40DA4B9A.8000908@namesys.com>
References: <40D8EB0D.6050109@namesys.com> <20040623063049.GA5080@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19308-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040623063049.GA5080@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Alex Zarochentsev wrote:

>On Tue, Jun 22, 2004 at 07:29:33PM -0700, Hans Reiser wrote:
>  
>
>>http://www.namesys.com/intbenchmarks/mongo/04.05.04/256MB.RAM/comparison/smart-8k.noENTD.vs.ENTD/comp-ENTD.vs.noENTD.html
>>    
>>
>
>Because direct page reclaiming (when a thread which needs memory does 
>try_to_relase_page() by itself) is better then indirect one (through
>ENTD or whatever page reclaiming daemon).  It is why Linux uses direct
>page reclaiming not indirect.
>
>  
>
I don't understand this statement.  Did you employ the algorithm I asked 
you to, with it throttling on every Nth page instead of every page?
