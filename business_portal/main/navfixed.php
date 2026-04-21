<style>.top-sticky { z-index: 1050 !important; }</style>
<?php if (!empty($_ENV['CLARITY_ID'])): ?>
<script type="text/javascript">
    (function(c,l,a,r,i,t,y){
        c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
        t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
        y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
    })(window, document, "clarity", "script", "<?php echo htmlspecialchars($_ENV['CLARITY_ID']); ?>");
</script>
<?php endif; ?>
<nav class="navbar navbar-inverse navbar-global navbar-fixed-top top-sticky">
				<a  class="navbar-brand" href="#">Vietstar Shipping</a>	
				<div class="toggle-navbar-btn toggle-truck"><i class="icon-truck icon-2x icon-2x"></i><span class="fs-4"></div>
				<ul class="nav nav-user pull-right"><!-- navbar-nav -->
					<li><a href="#"><i class="icon-user icon-large"></i> Welcome <?=$name?>!</a></li>
					<li><a href="../logout.php"><i class="icon-off icon-large"></i> Log Out</a></li> 
				</ul>
</nav><!--navbar navbar-inverse navbar-global navbar-fixed-top-->
