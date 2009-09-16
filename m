From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] reiserfs: Truncate blocks not used by a write (v2)
Date: Wed, 16 Sep 2009 14:48:15 -0700
Message-ID: <20090916144815.e544b319.akpm@linux-foundation.org>
References: <1253121912-20718-1-git-send-email-jack@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760186AbZIPVs6@vger.kernel.org>
In-Reply-To: <1253121912-20718-1-git-send-email-jack@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: linux-kernel@vger.kernel.org, hch@infradead.org, jack@suse.cz, reiserfs-devel@vger.kernel.org, jeffm@suse.com, Frederic Weisbecker <fweisbec@gmail.com>

On Wed, 16 Sep 2009 19:25:12 +0200
Jan Kara <jack@suse.cz> wrote:

> It can happen that write does not use all the blocks allocated in write_begin
> either because of some filesystem error (like ENOSPC) or because page with
> data to write has been removed from memory. We truncate these blocks so that
> we don't have dangling blocks beyond i_size.

This clashes a bit with the kill-the-bkl/reiserfs stuff in linux-next.
