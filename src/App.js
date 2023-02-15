import React, { useState, useEffect } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';

const App = () => {
    const [animes, setAnimes] = useState([]);

    useEffect(() => {
        fetch('https://gogoanime.consumet.stream/recent-release')
            .then(response => response.json())
            .then(data => setAnimes(data));
    }, []);

    return (
        <div>
            <nav className="navbar navbar-light bg-light">
                <span className="navbar-brand mb-0 h1">Animes Info</span>
            </nav>
            <div className="container my-5">
                <h1 className="text-center">Animes Info</h1>
                <div className="row">
                    {animes.map(anime => (
                        <div className="col-md-4 mb-3" key={anime.animeId}>
                            <div className="card">
                                <img src={anime.animeImg} className="card-img-top" alt={anime.animeTitle} style={{ height: "300px", objectFit: "cover" }} />
                                <div className="card-body">
                                    <h5 className="card-title">{anime.animeTitle}</h5>
                                    <p className="card-text">Episodio {anime.episodeNum}</p>
                                   

                                    <a key={anime.episodeId} target="_blank" rel="noreferrer noopener" href={anime.episodeUrl} className="btn btn-primary">Ver último episodio</a>
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
};

export default App;
