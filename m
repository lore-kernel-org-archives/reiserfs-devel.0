From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Some more basic questions.
Date: Mon, 10 Nov 2003 15:17:43 +0300
Message-ID: <20031110121743.GA1408@backtop.namesys.com>
References: <1068437719.3362.24.camel@voyager>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16031-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1068437719.3362.24.camel@voyager>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alejandro Sanchez Acosta <asanchez@gnome.org>
Cc: reiserfs-list@namesys.com

On Mon, Nov 10, 2003 at 05:15:20AM +0100, Alejandro Sanchez Acosta wrote:
> Hello,
 
> I don't understand so well how the dancing trees work. I've seen in the
> documentation that are faster than B+ trees, but I don't understand the
> reason. Somebody can explain me how does it work a dancing tree and
> where does reiserfs use it?

Reiser4 tree has no strict invariant that each node (except root) should be
filled by more than 50%.  Instead it has a rule that ordinary tree modification
deletes node only if it is empty.  Modified nodes are not written to disk until
jnode_flush() packs them more tighty.  The idea is to make ordinary tree
operations (insert, delete) cheaper and still have on-disk tree well packed,
because tree packing saves i/o operations.

> Other thing that I don't understand is the cache design, where are used
> caches in the filesystem? 

? 

Basically, reiser4 reads nodes from disk (into page cache),  nodes remain in
memory until system releases them and frees memory.  It is pache cache
functionality.
 
> And why is better to use extents than BLOBs? A lot of databases use
> BLOB's to storage the data and get good performance with.

acessing BLOBs require one disk op than accessing meta data.  In reiser4 you
see an attempt to implement "equal access cost" for all data, including file
bodies.
 
> What security features provide reiser4? 

IFAIK, currently only traditional unix security checks are implemented.

> I have seen that you can use
> crypto support and crypto compressing, does it support other security
> features? does it use the new CryptoAPI? 

no.
 
> And other thing, if I want to do a new plugin, what I have to do? Any
> documentation related?

Write new plugins using existing ones as template.  

What is bad is that reiser4 has no external API to bind reiser4 object and
plugins of different types.  I think Hans will agree with me that should be
fixed soon.

> Thanks in advance.
> -- 
> Alejandro Sanchez Acosta <asanchez@gnome.org>
> 

-- 
Alex.
