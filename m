From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: More on Hard Links (was A bold idea (Re: Carrying Attributes too Far))
Date: Fri, 5 Dec 2003 19:18:38 +0300
Message-ID: <16336.45022.572929.274859@laputa.namesys.com>
References: <2342084747-BeMail@cr593174-a>
	<3FD0912C.1090700@ninja.dynup.net>
	<16336.37772.88198.217245@laputa.namesys.com>
	<3FD0AB30.6060305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16252-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD0AB30.6060305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <jedi@ninja.dynup.net>, reiserfs-list@namesys.com

Hans Reiser writes:
 > Nikita Danilov wrote:
 > 
 > > But if multiple hard-links to the directories
 > >are allowed, file system is an arbitrary graph. It makes little sense to
 > >try to stretch reference counting to work in this situation. There are
 > >much more efficient forms of garbage collection for this.
 > >
 > >Nikita.
 > >
 > >
 > >  
 > >
 > Educate us, I am curious.

http://citeseer.nj.nec.com/jones03garbage.html is a recent bibliography
in this subject, containing more than 20000 references. I am afraid this
is little too much for a brief description. But basically, instead of
reclaiming garbage when "last reference" goes out, collectors typically
run periodically trying to find unreachable objects. Common way to do so
is to find -reachable- ones, and then to declare the rest
unreachable. Also, do avoid scanning the whole heap^Wfile system,
objects are segregated into "generations", and allocation is tuned so
that there are no references from object older generation to younger
one. Some smart techniques (like colored pointers) are used to avoid
garbage collection to proceed concurrently with mutators. And so
on. Large field for an experimentation.

 > 
 > -- 
 > Hans
 > 

Nikita.

 > 
