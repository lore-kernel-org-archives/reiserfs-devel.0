From: Mathieu Belanger <m@thieu.so>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Thu, 19 Sep 2013 18:09:49 +0000
Message-ID: <20130919180949.Horde.nfafj_-4N9u8NKKzsKcYlw1@mail.thieu.so>
References: <20130919151403.Horde.VoBIXKovROrctv021aPeYw7@mail.thieu.so>
 <20130919155519.Horde.ECPL8bqkTU-l0OG4BvsgnA1@mail.thieu.so>
 <CABYXC3ahREZe3ZxhphULa-W_+w1Ww5dXGvEU9DOBWWpL-Nqt0g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CABYXC3ahREZe3ZxhphULa-W_+w1Ww5dXGvEU9DOBWWpL-Nqt0g@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset=; format=flowed; DelSp=Yes; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christopher Gentile <cnjgentile@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Du?an ?oli? <dusanc@gmail.com>, Evgeniy <iron.udjin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>


I have ported the code to the new shrinker API (kernel 3.12-rc1) and  
removed the support for the old API a have added earlier.

It compile but did not test yet.

Here the diff to apply on the current Ivan patch (for Edward or other  
who don't use git):


@@ -31,9 +31,11 @@
   * Shrinks d_cursor_cache. Scan LRU list of unused cursors, freeing requested
   * number. Return number of still freeable cursors.
   */
-static int d_cursor_shrink(struct shrinker *shrink, struct  
shrink_control *sc)
+static unsigned long d_cursor_shrink_scan(struct shrinker *shrink,  
struct shrink_control *sc)
  {
-  if (sc->nr_to_scan != 0) {
+  unsigned long freed = 0;
+  unsigned long remain = sc->nr_to_scan;
+  if (remain != 0) {
      dir_cursor *scan;

      spin_lock(&d_c_lock);
@@ -41,12 +43,18 @@ static int d_cursor_shrink(struct shrinker  
*shrink, struct shrink_control *sc)
        scan = list_entry(cursor_cache.next, dir_cursor, alist);
        assert("nikita-3567", scan->ref == 0);
        kill_cursor(scan);
-      --sc->nr_to_scan;
-      if (sc->nr_to_scan == 0)
+      --remain;
+      freed++;
+      if (remain == 0)
          break;
      }
      spin_unlock(&d_c_lock);
    }
+  return freed;
+}
+
+static unsigned long d_cursor_shrink_count (struct shrinker *shrink,  
struct shrink_control *sc)
+{
    return d_cursor_unused;
  }

@@ -58,7 +66,8 @@ static int d_cursor_shrink(struct shrinker *shrink,  
struct shrink_control *sc)
   * shrunk only if system is really tight on memory.
   */
  static struct shrinker d_cursor_shrinker = {
-  .shrink = d_cursor_shrink,
+  .count_objects = d_cursor_shrink_count,
+  .scan_objects = d_cursor_shrink_scan,
    .seeks = DEFAULT_SEEKS << 3,
  };

