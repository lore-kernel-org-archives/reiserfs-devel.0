From: Timothy Webster <tdwebste2@yahoo.com>
Subject: Re: Several questions about encrypted filesystem
Date: Wed, 18 Jun 2003 08:20:20 -0700 (PDT)
Message-ID: <20030618152020.5273.qmail@web80502.mail.yahoo.com>
References: <20030618151207.57490.qmail@web80512.mail.yahoo.com>
Reply-To: tdwebste2@yahoo.com
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14609-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030618151207.57490.qmail@web80512.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tdwebste2@yahoo.com, Hans Reiser <reiser@namesys.com>
Cc: Edward Shushkin <edward@namesys.com>, "Zhao, Forrest" <forrest.zhao@intel.com>, reiserfs-list@namesys.com

Ops, the sealed authorization information
needs to be signed, but may not need to be
encrypted. This of course depends on the
security level encryption rules. 


--- Timothy Webster <tdwebste2@yahoo.com> wrote:
> 
> --- Hans Reiser <reiser@namesys.com> wrote:
> > Timothy Webster wrote:
> > 
> > >--- Hans Reiser <reiser@namesys.com> wrote:
> > >  
> > >
> > >>Timothy Webster wrote:
> > >>
> > >>    
> > >>
> > >>>2) Key rotation and backups
> > >>>Over time the number of keys quickly become
> > >>>prohibitive. 
> > >>>
> > >>>      
> > >>>
> > >>Why? One key per user or group or file body.
> user
> > >>and group keys unlock 
> > >>the file body key which is stored in the file
> > >>metadata.
> > >>    
> > >>
> > >
> > >This additional level of abstraction is a good
> > >one and greatly reduces the total number of 
> > >keys required. The key space is for user, 
> > >group, master, acl "keys" which in turn unlock 
> > >individual file body keys encrypted in the file 
> > >metadata. The file body keys are session keys,
> > >which may would change foreach encrypting writing
> > >process. Or is this not what you had in mind?
> > >
> > 
> > By default, no.  There was someone who proposed
> > granting write only 
> > permissions using a scheme in which keys change
> such
> > that if you know 
> > the first key you can compute the later ones but
> the
> > later ones don't 
> > allow you to compute the first ones, but this
> would
> > not be the default 
> > encryption plugin.
> > 
> > >Anyway, the user, group, master, acl "keys" need
> > >to change quite often, perhaps once a day.
> > >
> > Why?
> 
> A new key every time a user is issued a 
> new kerberos, ticket. The get a new key as
> needed. Since these tickets are used for
> encryption of file information, we can 
> not simple use create and forget.
> 
> > 
> > > The
> > >idea is to keep handing out new keys as needed.
> > >Or is your idea to retrive semi-perminate 
> > >metadata keys from a PKI. Which ever approach
> > >you take being able to construct a combined
> > >key is very useful. See my other mail
> > >"kool stuff". The number of key components
> > >starts adding up very quickly even if you don't
> > >change the metadata keys frequently.
> > >10 yrs later with all these key combinations 
> > >on lets say a mail server, you have far too 
> > >many keys to individually remember. And thus 
> > >the key space approach. 
> > >
> 
> Actually, I don't like my answer. So let me 
> try again. I think it is more of a question 
> how do you want to manage your keys.
> 
> Are your users careless with keys. They
> like to use them and lose them. And they
> use their keys in lots of conversations
> with some not so close friends. It is
> better not to keep using this key.
> I like to think of the key space approach
> as my stuff stored in bus lockers all over
> the place and I trust the bus company.
> By the time I want to retrieve my stuff 
> from one of the bus lockers, I have 
> forgotten my key so I read off the 
> box number and depot number. After 
> proving my identity to the key clerk 
> (who is verified by the key office), 
> the clerk checks up my authorization. 
> The authorization rules are in sealed
> envelope attached to the locker. And
> key clerks are authorized to unlock
> these envelops. Finally if I am 
> approved to recover the stuff in
> that box, she cuts me a new key. I grab 
> my stuff and run, leaving my key on
> the street. No big deal there are very
> few boxes it can open.
> In Key space approach the key index
> number and key space number is printed 
> on the file metadata. And I use the
> described key clear method to unlock
> the metadata. Of course I would probably
> not just leave the key laying around,
> but I might try it on other file 
> metadata. This handles the problem
> of how to hand over some of your
> files to another party, without
> handing over all of your files.
> You had not planed to hand over
> these files when you created them.
> Perhaps you did not even know this 
> party. 
> 
> 
> Or are your users carefull with keys
> and dont' trust athorities. Then
> your users are probably best sharing 
> keys directly with their fiends. Who 
> knows the secret police might ask 
> the key clerk for their bus locker 
> key. 
> Then key spaces are definitely
> NOT for you. Your users are much 
> better off managing their own keys,
> as trusting groups or individually.
> But perhaps key spaces might how
> they manage their keys. Do you
> care, NOPE, because they are doing
> the key management task.
> I still think even in this case
> it is a good idea to have the 
> authorization rules separately
> sealed but attached to the
> metadata.
> 
> -tim.
> 
> __________________________________
> Do you Yahoo!?
> SBC Yahoo! DSL - Now only $29.95 per month!
> http://sbc.yahoo.com

__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com
