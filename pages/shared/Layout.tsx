import PageHead from './PageHead';

interface Props {
  children: JSX.Element,
}

function Layout({children}: Props) {
  return (
    <>
      <PageHead />
      {children}
    </>
  );
}

export default Layout;
