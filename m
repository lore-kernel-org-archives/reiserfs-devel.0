From: Quinn Harris <reiserfs-list@quinnh.org>
Subject: Re: implementing reiserfs in C++ for a new OS
Date: Tue, 10 Aug 2004 13:12:48 -0600
Message-ID: <200408101312.48888.reiserfs-list@quinnh.org>
References: <71d3364904080706112e72fb6b@mail.gmail.com> <20040809172437.GP1284@nysv.org> <71d3364904080922267e8c14af@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20141-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <71d3364904080922267e8c14af@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

ReiserFS is a copyrighted work distributed under a GPL license and possibly 
others as the copyright holder Hans Reiser sees fit.  Copyright law protects 
an expression of an idea, as in the actual code, not the idea itself.  In 
other words, copyright law provides no legal means to restrict someone else 
from implementing the ideas in ReiserFS.  Patents on the other hand provide 
such power.  But I strongly doubt Hans holds any patents that would restrict 
the reimplementation of ReiserFS.

I believe it is your right to reimplement ReiserFS and I expect at least US 
law would back that up.  Despite this, I would question the cost 
effectiveness of doing so.  Reimplementing ReiserFS or any other file system 
is far from trivial.  You should strongly consider negotiating an alternative 
license for ReiserFS for a reasonable fee.  In doing so, you could have an 
excellent functional file system for Capitol OS in a very short time at a 
cost that could be subsantially lower than what it would take you to 
reimplement it.  It would also be much easier to transform a fully functional 
C code base into a C++ equivalent.

Considering that you would like to start from a fully functional file system 
design, I would assume that the file system design isn't a core part of the 
research in this project.  What I would expect you need is a good file system 
with a C++ interface to the rest of your kernel.  It should be vastly easier 
to create that interface on the existing code base than reimplement the 
entire file system in C++.

- Quinn


On Monday 09 August 2004 11:26 pm, Ramachandra K wrote:
> Let me clarify that the nature of Capital project is academic research.
>
> rgds
> Ram
