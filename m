From: Hans Reiser <reiser@namesys.com>
Subject: mm vs. official for reiser4.
Date: Fri, 06 Feb 2004 09:38:47 -0800
Message-ID: <4023D127.7030301@namesys.com>
References: <16419.38404.592630.141335@laputa.namesys.com>	<20040206140319.GC30481@favonius> <16419.41118.153096.216109@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16718-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16419.41118.153096.216109@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: sander@humilis.net, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Until we have removed all bugs that we can hit with internal testing, we 
will produce snapshots for use with only one kernel branch.  I am 
guessing that more reiser4 testers will use Linus kernel than Morton's.  
Readers should correct me if I err.....


Nikita Danilov wrote:

>Sander writes:
> > Hi Nikita,
> > 
> > Nikita Danilov wrote (ao):
> > > new snapshot has been released. It is mainly bug-fixing release.
> > > 
> > > Take a look at the READ.ME for the list of known problems.
> > 
> > There are two LATEST_IS files in the snapshots dir.
>
>Thanks, fixed.
>
> > 
> > Btw, can you please make a snapshot against the -mm tree? I think that
> > would help to get it included in that tree.
>
>Well, making two snapshots is kind of "double trouble", because both has
>to be tested and bug reports for them have to be handled. What we can
>do, on the other hand, is to make a decision to switch to the -mm series
>completely. But this is for Hans to decide.
>
>Are you actually having any problems with applying/running snapshot on
>top of -mm?
>
> > 
> > Thanks for this release!
> > 
> > With kind regards, Sander
>
>Nikita.
>
> > 
>
>
>  
>


