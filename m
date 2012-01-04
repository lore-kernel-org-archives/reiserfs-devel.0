From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Reiserfs.c bug in 3.2-rc5
Date: Tue, 3 Jan 2012 16:18:01 -0800
Message-ID: <CA+55aFxZ4_T8VRh6wAKC9-9PjsctrK1WnOmN-2EDNTeHA+OA4g@mail.gmail.com>
References: <43556.213.228.140.150.1323560920.squirrel@webmail.decimal.pt>
 <20111213180707.GI11747@quack.suse.cz> <!&!AAAAAAAAAAAYAAAAAAAAAKCACr8ZwetPrGXZsycJodKihAAAEAAAAGPJDX4w3wxIo8Onu2+q/xMBAAAAAA==@decimal.pt>
 <20120102115222.GA3626@quack.suse.cz> <20120103010826.GF3626@quack.suse.cz>
 <20120103123841.GA31457@quack.suse.cz> <1325604356.2095.23.camel@falcor>
 <CA+55aFzwq6XiAnX26uV+-mNsbGbnj0S=4nP5avPqKPw8OT+cmw@mail.gmail.com>
 <1325616312.2095.26.camel@falcor> <alpine.LRH.2.00.1201041046330.18098@tundra.namei.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type;
        bh=AHdBplfqKbrM9JeDww4SKeGfudTcuOQn79Hnfwp7l1w=;
        b=sGZBEw70ve69/jLSbTpdQP2L2chshvPyBuzRpk6Fpm0mWau+DQMhdGD6bZZviYsXLk
         cezcdSR/K2wwQ+ndjmCQgSrY9gX2PQHgzI0WCYUniM7sZl44CtrRATvjXh6aOJpTsWxO
         A1/0LMAzHhAnOBBjXs4IAT1zMmA6DfXaafVKs=
In-Reply-To: <alpine.LRH.2.00.1201041046330.18098@tundra.namei.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Morris <jmorris@namei.org>
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, haiyangz@microsoft.com, hjanssen@microsoft.com, "Rafael J. Wysocki" <rjw@sisk.pl>, Jorge Bastos <mysql.jorge@decimal.pt>, Mark Fasheh <mfasheh@suse.com>, Joel Becker <jlbec@evilplan.org>

On Tue, Jan 3, 2012 at 3:47 PM, James Morris <jmorris@namei.org> wrote:
>>
>> Just clarifying not all of commit fb88c2b, but only the
>> security_old_inode_init_security() hunk.
>
> Agreed.
>
> And yep, it's ugly :-\

Ok, applied - along with another last-minute fix - and pushed out.

Can everybody please test and double-check that what I applied was
what everybody agrees is the RightThing(tm)? I really wanted to do 3.2
today, but both of those commits are of the "please double-check"
kind, so..

                Linus
