From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 plugins
Date: Thu, 23 Jun 2005 21:31:32 +0400
Message-ID: <200506232131.33468.zam@namesys.com>
References: <20050620235458.5b437274.akpm@osdl.org> <200506221824.32995.zam@namesys.com> <20050622142947.GA26993@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
  boundary="Boundary-00=_1HvuC/bA8khzsro"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24501-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050622142947.GA26993@infradead.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org

--Boundary-00=_1HvuC/bA8khzsro
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 22 June 2005 18:29, Christoph Hellwig wrote:
> On Wed, Jun 22, 2005 at 06:24:32PM +0400, Alexander Zarochentsev wrote:
> > Reiser plugins are for the same.  Would you agree with reiser4 plugin
> > design if the plugins will not dispatch VFS object methods calls by
> > themselves but set ->foo_ops fileds instead?  I guess you don't like to
> > have the two dispatching systems at the same level.
>
> That is exactly the point I want to make.  I haven't looked at the design
> in detail for a long time, but schemes to allow different object to have
> different operation vectors is a good idea.  

By same level i meant the vfs-like portion of reiser4 object plugin (read/write/readdir ...).  The rest of plugin can't be done by VFS, it is about reiser4-specific things.  The way how vfs calls are passed to reiser4 objects can be re-written to use VFS features by 100% but i don't think it woild make the code better.  

What is done currently is 1) reduces places when VFS enters reiser4 --  better because each VFS method implementation needs at least reiser4 context initialization/destroying; 2) uses existing reiser4 plugin scheme -- it adds no complexity because reiser4 can't live without plugins.  
Can we leave the plugins as they are?

> We already have that to 
> varying degrees in all filesystems, and making that more formal is a good
> thing.

Thanks,
Alex.
--Boundary-00=_1HvuC/bA8khzsro
Content-Type: text/html;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

<html><head><meta name="qrichtext" content="1" /></head><body style="font-size:9pt;font-family:Sans Serif">
<p>On Wednesday 22 June 2005 18:29, Christoph Hellwig wrote:</p>
<p>&gt; On Wed, Jun 22, 2005 at 06:24:32PM +0400, Alexander Zarochentsev wrote:</p>
<p>&gt; &gt; Reiser plugins are for the same.  Would you agree with reiser4 plugin</p>
<p>&gt; &gt; design if the plugins will not dispatch VFS object methods calls by</p>
<p>&gt; &gt; themselves but set -&gt;foo_ops fileds instead?  I guess you don't like to</p>
<p>&gt; &gt; have the two dispatching systems at the same level.</p>
<p>&gt;</p>
<p>&gt; That is exactly the point I want to make.  I haven't looked at the design</p>
<p>&gt; in detail for a long time, but schemes to allow different object to have</p>
<p>&gt; different operation vectors is a good idea.  </p>
<p></p>
<p>By same level i meant the vfs-like portion of reiser4 object plugin (read/write/readdir ...).  The rest of plugin can't be done by VFS, it is about reiser4-specific things.  The way how vfs calls are passed to reiser4 objects can be re-written to use VFS features by 100% but i don't think it woild make the code better.  </p>
<p></p>
<p>What is done currently is 1) reduces places when VFS enters reiser4 --  better because each VFS method implementation needs at least reiser4 context initialization/destroying; 2) uses existing reiser4 plugin scheme -- it adds no complexity because reiser4 can't live without plugins.  </p>
<p>Can we leave the plugins as they are?</p>
<p></p>
<p>&gt; We already have that to </p>
<p>&gt; varying degrees in all filesystems, and making that more formal is a good</p>
<p>&gt; thing.</p>
<p></p>
<p>Thanks,</p>
<p>Alex.</p>
</body></html>
--Boundary-00=_1HvuC/bA8khzsro--

