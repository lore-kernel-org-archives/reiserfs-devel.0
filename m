From: Timothy Webster <tdwebste2@yahoo.com>
Subject: Re: Several questions about encrypted filesystem
Date: Tue, 17 Jun 2003 19:06:54 -0700 (PDT)
Message-ID: <20030618020654.70894.qmail@web80506.mail.yahoo.com>
References: <3EEF4E58.1E61F66F@namesys.com>
Reply-To: tdwebste2@yahoo.com
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14594-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EEF4E58.1E61F66F@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shushkin <edward@namesys.com>
Cc: "Zhao, Forrest" <forrest.zhao@intel.com>, reiserfs-list@namesys.com


--- Edward Shushkin <edward@namesys.com> wrote:
> Timothy Webster wrote:
> > 2) Key rotation and backups
> > Over time the number of keys quickly become
> > prohibitive. You need to in stead store the "seed
key
> > and the dimension" of multi-dimension key space.
The
> > multi-dimension key space is actually several key
> > spaces combined to make a higher dimensional key
> > space.
> > The key space is created by sequencal encryption
of
> > the seed key inserted into dimension space
controlled
> > by a "secure" psedo-random walk. When a new key is
> > required it is taken form the mult-dimensional key
> > space as the next index number. Keys don't need to
use
> > all the deminsion in its index number.
> 
> Ok, this requires additional identification (key,
seed).
> So if you export a key created 10 years ago, then
there 
> will be only one key in the appropriate
multi-dimension
> key space, right? ;)
> 
> Edward. 

>  Which allows

You are quite right, in order to recover the key you 
need the (key seed, pseudo-random walk, and the 
deminsions) of each key space of the multi-deminision 
key space. You may also wish store the pseudo-random 
walk seed. I recommend you do, otherwise it may be
possible for an attacker to some how gather a few 
key points and knowing the pseudo-random walk, 
regenerate their own key space. Which means you 
need to "securely store" key space number, key seed, 
pseudo-random walk seed, "sets".To recover a 
specific key created 10 years ago, you need its
index number and its multi-dimensional key space 
number. To use the dimensions of the multi-dimension
key space, there are few approaches. First is to
combine the key components; 
- using the same technequies by which incremential 
hashes are combinded,
- or a selection, (this of course) is equivalent 
to onlyusing one key space of the multi-deminsional 
key space.

By the way you can do some really kool interesting 
stuffbased on how you construct the combined keys.
You can set up an error correcting code such that 
to reconstruct the key you need at least x parts 
from component group A and y parts from component 
group B andso on to as many component groups you
want. This is handy if you are going to allow 
multiple users to retrive a file created 10 years 
ago. Doing the combined key at this level gets 
around the problem that a "key server" own by 
company / country "C" does not want this 
information recovered. And you don't wish to give 
them veto power.Or if you lost one (key space number) 
set.

Forgive me it has been over 5 years since I thought 
of about this. So a lot of this is just coming off 
the top of my head. :)


-tim.

The the need for speed brings of the next issue 
incrementalfile part hashes and encryptions. The 
incremental parts can be combined using discrete 
log or nap sack type combining. XORing allows a 
sub problem attact. It is also handy to keep in 
mind that also knowing the file or file part size
greatly reduces the chance of collision.


> > transition to new key spaces as old ones get
filled.
> > Or Remote sites which will ofcourse have different
key
> > spaces.
> > 
> > At some point in the future a particular key is
> > required, it is retrived by first regenating the
key
> > space, then using the key in the key space
specified
> > my the "particular" key's index number. There is
no
> > reason that the key's index number and key space
> > "number" can not be stored in the clear, lets say
in
> > the file header.
> > 
> > Using this method there is basically unlimited
keys
> > available, and they can be stored and retrived
> > efficently.
> > 
> > This is brief and incomplete.
> > -tim
> > > 


__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com
